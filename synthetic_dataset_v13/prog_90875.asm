; DESCRIPTION: Composite: Places a cyan 88x48 rectangle at position (161, 33) then Renders a blue line between points (222, 49) and (508, 178) then Creates a green circular shape at (298, 99) with radius 58.
; PLAN: r0=161(x), r1=33(y), r2=88(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=49(y1), r7=508(x2), r8=178(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=99(y), r12=58(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 33
LDI r2, 88
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 49
LDI r7, 508
LDI r8, 178
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 99
LDI r12, 58
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
