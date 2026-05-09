; DESCRIPTION: Composite: Renders a yellow box of size 30x31 starting at (370, 50) then Sets a single blue pixel at (418, 140) then Places a orange line segment connecting (250, 125) to (133, 143).
; PLAN: r0=370(x), r1=50(y), r2=30(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=140(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=250(x1), r11=125(y1), r12=133(x2), r13=143(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 50
LDI r2, 30
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 140
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 250
LDI r11, 125
LDI r12, 133
LDI r13, 143
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
