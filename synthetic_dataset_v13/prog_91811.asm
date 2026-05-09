; DESCRIPTION: Composite: Creates a blue rectangular region at (66, 141) spanning 33 by 40 pixels then Renders a yellow line between points (234, 189) and (234, 235) then Renders a orange disk with center (185, 146) and radius 32.
; PLAN: r0=66(x), r1=141(y), r2=33(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x1), r6=189(y1), r7=234(x2), r8=235(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=185(x), r11=146(y), r12=32(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 141
LDI r2, 33
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 189
LDI r7, 234
LDI r8, 235
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 185
LDI r11, 146
LDI r12, 32
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
