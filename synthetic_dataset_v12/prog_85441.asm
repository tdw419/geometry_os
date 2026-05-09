; DESCRIPTION: Composite: Draws a black line from (410, 86) to (487, 122) then Sets a single orange pixel at (138, 251) then Places a orange circle of radius 20 at center (195, 120).
; PLAN: r0=410(x1), r1=86(y1), r2=487(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=251(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=120(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 86
LDI r2, 487
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 251
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 195
LDI r11, 120
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
