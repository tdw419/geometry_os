; DESCRIPTION: Composite: Renders a blue disk with center (264, 70) and radius 69 then Renders a green line between points (439, 240) and (121, 0) then Places a orange 18x62 rectangle at position (161, 22).
; PLAN: r0=264(x), r1=70(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x1), r6=240(y1), r7=121(x2), r8=0(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=22(y), r12=18(width), r13=62(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 70
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 240
LDI r7, 121
LDI r8, 0
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 22
LDI r12, 18
LDI r13, 62
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
