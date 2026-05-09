; DESCRIPTION: Composite: Draws a blue line from (75, 15) to (204, 106) then Sets a single orange pixel at (441, 95) then Draws a orange rectangle at (415, 63) with width 14 and height 64.
; PLAN: r0=75(x1), r1=15(y1), r2=204(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=95(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=63(y), r12=14(width), r13=64(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 15
LDI r2, 204
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 95
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 415
LDI r11, 63
LDI r12, 14
LDI r13, 64
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
