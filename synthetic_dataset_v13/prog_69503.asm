; DESCRIPTION: Composite: Places a yellow line segment connecting (229, 189) to (453, 115) then Places a magenta dot at position (387, 200) then Draws a green circle centered at (300, 225) with radius 14.
; PLAN: r0=229(x1), r1=189(y1), r2=453(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=200(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=300(x), r11=225(y), r12=14(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 189
LDI r2, 453
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 200
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 300
LDI r11, 225
LDI r12, 14
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
