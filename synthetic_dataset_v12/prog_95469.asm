; DESCRIPTION: Composite: Renders a purple line between points (49, 246) and (133, 38) then Creates a yellow rectangular region at (332, 20) spanning 67 by 20 pixels then Places a magenta dot at position (293, 231).
; PLAN: r0=49(x1), r1=246(y1), r2=133(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=20(y), r7=67(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=293(x), r11=231(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 246
LDI r2, 133
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 20
LDI r7, 67
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 231
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
