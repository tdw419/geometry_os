; DESCRIPTION: Composite: Places a black line segment connecting (439, 59) to (470, 122) then Sets a single red pixel at (431, 253) then Places a red 107x19 rectangle at position (149, 121).
; PLAN: r0=439(x1), r1=59(y1), r2=470(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=253(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=149(x), r11=121(y), r12=107(width), r13=19(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 59
LDI r2, 470
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 253
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 149
LDI r11, 121
LDI r12, 107
LDI r13, 19
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
