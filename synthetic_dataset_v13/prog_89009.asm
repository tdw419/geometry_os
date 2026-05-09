; DESCRIPTION: Composite: Renders a blue line between points (180, 242) and (125, 221) then Sets a single purple pixel at (37, 128) then Places a purple circle of radius 45 at center (419, 48).
; PLAN: r0=180(x1), r1=242(y1), r2=125(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=37(x), r6=128(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=48(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 180
LDI r1, 242
LDI r2, 125
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 128
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 48
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
