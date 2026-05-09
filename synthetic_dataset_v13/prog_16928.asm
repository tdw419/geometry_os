; DESCRIPTION: Composite: Draws a yellow rectangle at (33, 192) with width 75 and height 64 then Renders a yellow line between points (288, 12) and (230, 50) then Renders a orange disk with center (168, 155) and radius 74.
; PLAN: r0=33(x), r1=192(y), r2=75(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x1), r6=12(y1), r7=230(x2), r8=50(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=168(x), r11=155(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 192
LDI r2, 75
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 12
LDI r7, 230
LDI r8, 50
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 155
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
