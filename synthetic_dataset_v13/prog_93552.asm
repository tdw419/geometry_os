; DESCRIPTION: Composite: Places a purple dot at position (101, 136) then Draws a yellow line from (387, 19) to (389, 211) then Draws a white circle centered at (267, 126) with radius 12.
; PLAN: r0=101(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=387(x1), r6=19(y1), r7=389(x2), r8=211(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=126(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 101
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 19
LDI r7, 389
LDI r8, 211
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 126
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
