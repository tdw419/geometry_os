; DESCRIPTION: Composite: Renders a purple disk with center (226, 69) and radius 31 then Renders a purple box of size 56x34 starting at (440, 85).
; PLAN: r0=226(x), r1=69(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=440(x), r6=85(y), r7=56(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 69
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 440
LDI r6, 85
LDI r7, 56
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
