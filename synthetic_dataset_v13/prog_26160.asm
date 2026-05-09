; DESCRIPTION: Composite: Draws a black rectangle at (10, 47) with width 56 and height 22 then Renders a blue line between points (196, 164) and (184, 212) then Places a blue circle of radius 26 at center (294, 76).
; PLAN: r0=10(x), r1=47(y), r2=56(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x1), r6=164(y1), r7=184(x2), r8=212(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=76(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 47
LDI r2, 56
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 164
LDI r7, 184
LDI r8, 212
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 76
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
