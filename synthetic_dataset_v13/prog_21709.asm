; DESCRIPTION: Composite: Places a white circle of radius 63 at center (144, 79) then Places a white dot at position (92, 220) then Draws a white line from (319, 59) to (163, 90).
; PLAN: r0=144(x), r1=79(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=220(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=319(x1), r11=59(y1), r12=163(x2), r13=90(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 79
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 220
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 319
LDI r11, 59
LDI r12, 163
LDI r13, 90
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
