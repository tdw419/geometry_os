; DESCRIPTION: Composite: Places a yellow circle of radius 66 at center (344, 157) then Places a green dot at position (10, 131) then Places a black line segment connecting (169, 150) to (393, 192).
; PLAN: r0=344(x), r1=157(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=131(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=169(x1), r11=150(y1), r12=393(x2), r13=192(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 157
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 131
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 169
LDI r11, 150
LDI r12, 393
LDI r13, 192
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
