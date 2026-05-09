; DESCRIPTION: Composite: Sets a single white pixel at (71, 133) then Renders a red box of size 40x86 starting at (292, 164).
; PLAN: r0=71(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=164(y), r7=40(width), r8=86(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 164
LDI r7, 40
LDI r8, 86
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
