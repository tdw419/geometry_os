; DESCRIPTION: Composite: Draws a purple rectangle at (334, 6) with width 80 and height 44 then Sets a single orange pixel at (466, 247) then Renders a black line between points (396, 204) and (37, 222).
; PLAN: r0=334(x), r1=6(y), r2=80(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x), r6=247(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=396(x1), r11=204(y1), r12=37(x2), r13=222(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 6
LDI r2, 80
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 247
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 396
LDI r11, 204
LDI r12, 37
LDI r13, 222
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
