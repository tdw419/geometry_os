; DESCRIPTION: Composite: Draws a yellow line from (255, 51) to (400, 120) then Sets a single cyan pixel at (345, 236) then Places a orange circle of radius 50 at center (449, 53).
; PLAN: r0=255(x1), r1=51(y1), r2=400(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=236(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=449(x), r11=53(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 51
LDI r2, 400
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 236
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 449
LDI r11, 53
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
