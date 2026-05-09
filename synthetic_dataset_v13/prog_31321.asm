; DESCRIPTION: Composite: Places a black 59x44 rectangle at position (205, 107) then Draws a black line from (474, 30) to (347, 138) then Sets a single white pixel at (318, 54).
; PLAN: r0=205(x), r1=107(y), r2=59(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=474(x1), r6=30(y1), r7=347(x2), r8=138(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=318(x), r11=54(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 107
LDI r2, 59
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 474
LDI r6, 30
LDI r7, 347
LDI r8, 138
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 318
LDI r11, 54
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
