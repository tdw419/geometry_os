; DESCRIPTION: Composite: Places a cyan line segment connecting (236, 251) to (271, 253) then Places a orange dot at position (95, 184) then Places a purple circle of radius 61 at center (223, 159).
; PLAN: r0=236(x1), r1=251(y1), r2=271(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=159(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 251
LDI r2, 271
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 223
LDI r11, 159
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
