; DESCRIPTION: Composite: Sets a single black pixel at (87, 128) then Draws a green line from (321, 51) to (391, 158) then Places a blue 47x49 rectangle at position (325, 28).
; PLAN: r0=87(x), r1=128(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=321(x1), r6=51(y1), r7=391(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=28(y), r12=47(width), r13=49(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 128
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 51
LDI r7, 391
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 28
LDI r12, 47
LDI r13, 49
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
