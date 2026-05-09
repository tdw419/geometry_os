; DESCRIPTION: Composite: Places a purple line segment connecting (336, 254) to (12, 130) then Creates a magenta rectangular region at (109, 4) spanning 99 by 120 pixels then Places a white dot at position (99, 67).
; PLAN: r0=336(x1), r1=254(y1), r2=12(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=4(y), r7=99(width), r8=120(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=99(x), r11=67(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 254
LDI r2, 12
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 4
LDI r7, 99
LDI r8, 120
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 67
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
