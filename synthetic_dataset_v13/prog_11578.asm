; DESCRIPTION: Composite: Renders a red box of size 90x70 starting at (290, 155) then Sets a single white pixel at (194, 33).
; PLAN: r0=290(x), r1=155(y), r2=90(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=33(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 155
LDI r2, 90
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 33
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
