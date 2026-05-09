; DESCRIPTION: Composite: Draws a blue circle centered at (82, 80) with radius 80 then Sets a single purple pixel at (178, 28) then Renders a white line between points (57, 51) and (4, 2).
; PLAN: r0=82(x), r1=80(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=28(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=57(x1), r11=51(y1), r12=4(x2), r13=2(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 80
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 28
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 57
LDI r11, 51
LDI r12, 4
LDI r13, 2
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
