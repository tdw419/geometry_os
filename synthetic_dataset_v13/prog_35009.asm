; DESCRIPTION: Composite: Renders a orange box of size 108x41 starting at (278, 167) then Draws a blue line from (466, 32) to (405, 101) then Renders a green disk with center (462, 101) and radius 26.
; PLAN: r0=278(x), r1=167(y), r2=108(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x1), r6=32(y1), r7=405(x2), r8=101(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=101(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 167
LDI r2, 108
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 32
LDI r7, 405
LDI r8, 101
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 101
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
