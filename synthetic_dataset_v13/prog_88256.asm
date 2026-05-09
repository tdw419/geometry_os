; DESCRIPTION: Composite: Draws a white rectangle at (138, 32) with width 38 and height 47 then Renders a purple disk with center (468, 118) and radius 23.
; PLAN: r0=138(x), r1=32(y), r2=38(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=118(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 32
LDI r2, 38
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 118
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
