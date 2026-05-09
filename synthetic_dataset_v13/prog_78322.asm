; DESCRIPTION: Composite: Draws a white circle centered at (97, 155) with radius 28 then Places a cyan dot at position (452, 163) then Draws a black line from (389, 73) to (222, 33).
; PLAN: r0=97(x), r1=155(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x), r6=163(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=389(x1), r11=73(y1), r12=222(x2), r13=33(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 155
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 163
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 389
LDI r11, 73
LDI r12, 222
LDI r13, 33
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
