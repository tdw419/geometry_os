; DESCRIPTION: Composite: Places a magenta dot at position (298, 89) then Places a white circle of radius 63 at center (162, 136) then Draws a white line from (453, 147) to (436, 162).
; PLAN: r0=298(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=136(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x1), r11=147(y1), r12=436(x2), r13=162(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 136
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 147
LDI r12, 436
LDI r13, 162
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
