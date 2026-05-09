; DESCRIPTION: Composite: Draws a orange line from (499, 133) to (386, 154) then Places a orange 44x46 rectangle at position (64, 153) then Places a magenta circle of radius 70 at center (109, 176).
; PLAN: r0=499(x1), r1=133(y1), r2=386(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=153(y), r7=44(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=109(x), r11=176(y), r12=70(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 133
LDI r2, 386
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 153
LDI r7, 44
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 176
LDI r12, 70
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
