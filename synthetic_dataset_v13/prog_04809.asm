; DESCRIPTION: Composite: Places a green line segment connecting (268, 28) to (416, 127) then Sets a single purple pixel at (196, 196) then Creates a blue circular shape at (317, 83) with radius 13.
; PLAN: r0=268(x1), r1=28(y1), r2=416(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=196(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=317(x), r11=83(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 28
LDI r2, 416
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 196
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 317
LDI r11, 83
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
