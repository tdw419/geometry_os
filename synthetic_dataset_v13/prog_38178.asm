; DESCRIPTION: Composite: Places a white circle of radius 73 at center (386, 80) then Sets a single green pixel at (454, 255) then Places a blue line segment connecting (110, 28) to (109, 238).
; PLAN: r0=386(x), r1=80(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=255(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=110(x1), r11=28(y1), r12=109(x2), r13=238(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 80
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 255
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 110
LDI r11, 28
LDI r12, 109
LDI r13, 238
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
