; DESCRIPTION: Composite: Places a black circle of radius 69 at center (97, 109) then Places a black line segment connecting (271, 240) to (368, 229) then Places a purple dot at position (305, 128).
; PLAN: r0=97(x), r1=109(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x1), r6=240(y1), r7=368(x2), r8=229(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=128(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 109
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 240
LDI r7, 368
LDI r8, 229
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 128
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
