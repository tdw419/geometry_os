; DESCRIPTION: Composite: Creates a cyan circular shape at (449, 35) with radius 33 then Renders a black line between points (353, 185) and (119, 143) then Renders a blue box of size 115x29 starting at (130, 207).
; PLAN: r0=449(x), r1=35(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x1), r6=185(y1), r7=119(x2), r8=143(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=207(y), r12=115(width), r13=29(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 35
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 185
LDI r7, 119
LDI r8, 143
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 207
LDI r12, 115
LDI r13, 29
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
