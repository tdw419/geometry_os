; DESCRIPTION: Composite: Places a black line segment connecting (13, 235) to (400, 213) then Sets a single orange pixel at (150, 231) then Creates a blue rectangular region at (268, 132) spanning 39 by 102 pixels.
; PLAN: r0=13(x1), r1=235(y1), r2=400(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=231(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=268(x), r11=132(y), r12=39(width), r13=102(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 235
LDI r2, 400
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 231
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 268
LDI r11, 132
LDI r12, 39
LDI r13, 102
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
