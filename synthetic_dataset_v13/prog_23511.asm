; DESCRIPTION: Composite: Draws a orange line from (282, 248) to (478, 242) then Sets a single purple pixel at (398, 108) then Places a blue circle of radius 70 at center (294, 145).
; PLAN: r0=282(x1), r1=248(y1), r2=478(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=108(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=145(y), r12=70(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 282
LDI r1, 248
LDI r2, 478
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 108
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 294
LDI r11, 145
LDI r12, 70
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
