; DESCRIPTION: Composite: Draws a magenta line from (219, 184) to (315, 90) then Sets a single cyan pixel at (171, 235) then Places a blue 74x33 rectangle at position (17, 64).
; PLAN: r0=219(x1), r1=184(y1), r2=315(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=235(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=17(x), r11=64(y), r12=74(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 184
LDI r2, 315
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 235
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 17
LDI r11, 64
LDI r12, 74
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
