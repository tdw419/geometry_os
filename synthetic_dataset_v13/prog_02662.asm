; DESCRIPTION: Composite: Renders a cyan disk with center (390, 228) and radius 14 then Creates a green rectangular region at (140, 31) spanning 85 by 113 pixels then Places a orange line segment connecting (466, 24) to (495, 16).
; PLAN: r0=390(x), r1=228(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x), r6=31(y), r7=85(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x1), r11=24(y1), r12=495(x2), r13=16(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 228
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 31
LDI r7, 85
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 24
LDI r12, 495
LDI r13, 16
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
