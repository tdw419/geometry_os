; DESCRIPTION: Composite: Renders a black disk with center (284, 121) and radius 58 then Renders a red line between points (149, 181) and (298, 235) then Renders a green box of size 60x93 starting at (84, 49).
; PLAN: r0=284(x), r1=121(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=149(x1), r6=181(y1), r7=298(x2), r8=235(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=84(x), r11=49(y), r12=60(width), r13=93(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 121
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 149
LDI r6, 181
LDI r7, 298
LDI r8, 235
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 49
LDI r12, 60
LDI r13, 93
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
