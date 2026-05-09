; DESCRIPTION: Composite: Renders a black line between points (481, 44) and (448, 230) then Sets a single red pixel at (177, 13) then Places a yellow 62x103 rectangle at position (296, 152).
; PLAN: r0=481(x1), r1=44(y1), r2=448(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=13(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=296(x), r11=152(y), r12=62(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 44
LDI r2, 448
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 13
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 296
LDI r11, 152
LDI r12, 62
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
