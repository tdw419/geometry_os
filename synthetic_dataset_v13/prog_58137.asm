; DESCRIPTION: Composite: Places a green line segment connecting (402, 46) to (57, 207) then Creates a orange circular shape at (170, 72) with radius 65 then Sets a single purple pixel at (305, 145).
; PLAN: r0=402(x1), r1=46(y1), r2=57(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=72(y), r7=65(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=145(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 402
LDI r1, 46
LDI r2, 57
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 72
LDI r7, 65
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 145
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
