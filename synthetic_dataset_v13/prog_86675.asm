; DESCRIPTION: Composite: Sets a single blue pixel at (337, 11) then Renders a cyan box of size 41x24 starting at (2, 70).
; PLAN: r0=337(x), r1=11(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=70(y), r7=41(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 11
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 2
LDI r6, 70
LDI r7, 41
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
