; DESCRIPTION: Composite: Draws a purple line from (354, 73) to (295, 226) then Sets a single black pixel at (50, 116) then Creates a blue circular shape at (152, 75) with radius 24.
; PLAN: r0=354(x1), r1=73(y1), r2=295(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=152(x), r11=75(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 354
LDI r1, 73
LDI r2, 295
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 152
LDI r11, 75
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
