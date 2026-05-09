; DESCRIPTION: Composite: Draws a black line from (55, 145) to (440, 147) then Creates a orange rectangular region at (482, 55) spanning 24 by 45 pixels then Places a white dot at position (249, 61).
; PLAN: r0=55(x1), r1=145(y1), r2=440(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=482(x), r6=55(y), r7=24(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=249(x), r11=61(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 145
LDI r2, 440
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 55
LDI r7, 24
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 249
LDI r11, 61
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
