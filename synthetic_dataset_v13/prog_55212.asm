; DESCRIPTION: Composite: Renders a purple box of size 98x87 starting at (351, 149) then Renders a orange line between points (173, 253) and (386, 195) then Draws a white circle centered at (183, 133) with radius 26.
; PLAN: r0=351(x), r1=149(y), r2=98(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=253(y1), r7=386(x2), r8=195(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=133(y), r12=26(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 149
LDI r2, 98
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 253
LDI r7, 386
LDI r8, 195
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 133
LDI r12, 26
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
