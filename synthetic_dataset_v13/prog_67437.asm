; DESCRIPTION: Composite: Renders a cyan line between points (477, 132) and (475, 29) then Sets a single red pixel at (64, 9) then Draws a red rectangle at (127, 13) with width 91 and height 51.
; PLAN: r0=477(x1), r1=132(y1), r2=475(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=9(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=13(y), r12=91(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 132
LDI r2, 475
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 9
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 127
LDI r11, 13
LDI r12, 91
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
