; DESCRIPTION: Composite: Renders a purple line between points (331, 175) and (16, 240) then Creates a purple rectangular region at (6, 93) spanning 85 by 96 pixels.
; PLAN: r0=331(x1), r1=175(y1), r2=16(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=93(y), r7=85(width), r8=96(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 175
LDI r2, 16
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 93
LDI r7, 85
LDI r8, 96
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
