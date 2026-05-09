; DESCRIPTION: Composite: Renders a purple line between points (293, 9) and (179, 156) then Creates a blue rectangular region at (87, 149) spanning 39 by 67 pixels.
; PLAN: r0=293(x1), r1=9(y1), r2=179(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=149(y), r7=39(width), r8=67(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 9
LDI r2, 179
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 149
LDI r7, 39
LDI r8, 67
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
