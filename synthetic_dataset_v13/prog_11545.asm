; DESCRIPTION: Composite: Draws a blue line from (445, 57) to (163, 8) then Sets a single orange pixel at (356, 226) then Places a green 95x113 rectangle at position (302, 17).
; PLAN: r0=445(x1), r1=57(y1), r2=163(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=356(x), r6=226(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=17(y), r12=95(width), r13=113(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 57
LDI r2, 163
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 226
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 302
LDI r11, 17
LDI r12, 95
LDI r13, 113
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
