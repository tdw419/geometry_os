; DESCRIPTION: Composite: Draws a yellow line from (442, 236) to (188, 212) then Renders a orange box of size 35x52 starting at (415, 78) then Places a green dot at position (122, 184).
; PLAN: r0=442(x1), r1=236(y1), r2=188(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=78(y), r7=35(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x), r11=184(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 236
LDI r2, 188
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 78
LDI r7, 35
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 184
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
