; DESCRIPTION: Composite: Draws a cyan line from (351, 45) to (493, 58) then Places a black circle of radius 32 at center (196, 51) then Sets a single white pixel at (478, 154).
; PLAN: r0=351(x1), r1=45(y1), r2=493(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=51(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=478(x), r11=154(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 45
LDI r2, 493
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 51
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 478
LDI r11, 154
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
