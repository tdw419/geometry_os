; DESCRIPTION: Composite: Places a white 105x31 rectangle at position (119, 212) then Places a black dot at position (441, 2) then Draws a orange line from (51, 40) to (295, 150).
; PLAN: r0=119(x), r1=212(y), r2=105(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=2(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=51(x1), r11=40(y1), r12=295(x2), r13=150(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 212
LDI r2, 105
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 2
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 51
LDI r11, 40
LDI r12, 295
LDI r13, 150
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
