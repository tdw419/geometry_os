; DESCRIPTION: Composite: Renders a purple line between points (12, 57) and (98, 36) then Sets a single magenta pixel at (199, 99) then Draws a blue rectangle at (275, 96) with width 63 and height 94.
; PLAN: r0=12(x1), r1=57(y1), r2=98(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=99(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=96(y), r12=63(width), r13=94(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 57
LDI r2, 98
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 99
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 96
LDI r12, 63
LDI r13, 94
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
