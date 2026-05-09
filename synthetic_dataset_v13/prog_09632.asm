; DESCRIPTION: Composite: Places a purple 29x54 rectangle at position (218, 178) then Sets a single orange pixel at (437, 20) then Draws a orange line from (84, 7) to (460, 236).
; PLAN: r0=218(x), r1=178(y), r2=29(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=437(x), r6=20(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=84(x1), r11=7(y1), r12=460(x2), r13=236(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 178
LDI r2, 29
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 20
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 84
LDI r11, 7
LDI r12, 460
LDI r13, 236
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
