; DESCRIPTION: Composite: Places a purple circle of radius 18 at center (374, 82) then Sets a single purple pixel at (115, 194) then Renders a white line between points (288, 1) and (193, 161).
; PLAN: r0=374(x), r1=82(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=194(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=288(x1), r11=1(y1), r12=193(x2), r13=161(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 82
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 194
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 1
LDI r12, 193
LDI r13, 161
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
