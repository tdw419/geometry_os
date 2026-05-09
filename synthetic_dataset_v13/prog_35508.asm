; DESCRIPTION: Composite: Sets a single magenta pixel at (46, 238) then Renders a red box of size 41x44 starting at (275, 209).
; PLAN: r0=46(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=209(y), r7=41(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 209
LDI r7, 41
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
