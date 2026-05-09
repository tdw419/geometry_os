; DESCRIPTION: Composite: Places a magenta line segment connecting (443, 38) to (501, 64) then Places a orange 97x42 rectangle at position (1, 135) then Renders a black disk with center (436, 90) and radius 66.
; PLAN: r0=443(x1), r1=38(y1), r2=501(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=135(y), r7=97(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=436(x), r11=90(y), r12=66(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 38
LDI r2, 501
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 135
LDI r7, 97
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 90
LDI r12, 66
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
