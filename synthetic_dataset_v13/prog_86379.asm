; DESCRIPTION: Composite: Draws a yellow circle centered at (165, 112) with radius 63 then Places a cyan dot at position (314, 102) then Draws a blue line from (379, 235) to (310, 7).
; PLAN: r0=165(x), r1=112(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=102(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=379(x1), r11=235(y1), r12=310(x2), r13=7(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 112
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 102
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 379
LDI r11, 235
LDI r12, 310
LDI r13, 7
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
