; DESCRIPTION: Composite: Draws a magenta line from (293, 217) to (293, 90) then Sets a single green pixel at (172, 4) then Draws a blue rectangle at (446, 75) with width 13 and height 108.
; PLAN: r0=293(x1), r1=217(y1), r2=293(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=4(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=446(x), r11=75(y), r12=13(width), r13=108(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 217
LDI r2, 293
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 4
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 446
LDI r11, 75
LDI r12, 13
LDI r13, 108
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
