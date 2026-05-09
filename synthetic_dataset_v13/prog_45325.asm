; DESCRIPTION: Composite: Draws a black line from (52, 211) to (94, 5) then Sets a single black pixel at (476, 38) then Renders a orange box of size 51x70 starting at (79, 35).
; PLAN: r0=52(x1), r1=211(y1), r2=94(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=38(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=35(y), r12=51(width), r13=70(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 211
LDI r2, 94
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 38
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 79
LDI r11, 35
LDI r12, 51
LDI r13, 70
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
