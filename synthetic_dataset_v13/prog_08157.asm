; DESCRIPTION: Composite: Draws a black line from (363, 175) to (431, 3) then Places a red dot at position (111, 116) then Renders a magenta box of size 114x74 starting at (185, 35).
; PLAN: r0=363(x1), r1=175(y1), r2=431(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=111(x), r6=116(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=185(x), r11=35(y), r12=114(width), r13=74(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 175
LDI r2, 431
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 116
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 185
LDI r11, 35
LDI r12, 114
LDI r13, 74
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
