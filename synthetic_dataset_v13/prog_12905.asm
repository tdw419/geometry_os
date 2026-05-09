; DESCRIPTION: Composite: Draws a green line from (263, 251) to (497, 51) then Places a green dot at position (76, 80) then Draws a orange rectangle at (2, 108) with width 55 and height 74.
; PLAN: r0=263(x1), r1=251(y1), r2=497(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=80(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=2(x), r11=108(y), r12=55(width), r13=74(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 251
LDI r2, 497
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 80
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 2
LDI r11, 108
LDI r12, 55
LDI r13, 74
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
