; DESCRIPTION: Composite: Draws a white line from (477, 90) to (354, 61) then Sets a single purple pixel at (452, 57) then Draws a black rectangle at (80, 174) with width 80 and height 55.
; PLAN: r0=477(x1), r1=90(y1), r2=354(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=174(y), r12=80(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 90
LDI r2, 354
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 80
LDI r11, 174
LDI r12, 80
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
