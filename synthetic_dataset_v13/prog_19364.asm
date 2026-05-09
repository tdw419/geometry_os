; DESCRIPTION: Composite: Places a black line segment connecting (470, 4) to (101, 133) then Sets a single magenta pixel at (384, 168) then Creates a green circular shape at (58, 189) with radius 46.
; PLAN: r0=470(x1), r1=4(y1), r2=101(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=168(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=189(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 470
LDI r1, 4
LDI r2, 101
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 168
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 189
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
