; DESCRIPTION: Composite: Places a blue dot at position (350, 16) then Draws a yellow circle centered at (353, 147) with radius 78 then Draws a black line from (58, 71) to (413, 30).
; PLAN: r0=350(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=147(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x1), r11=71(y1), r12=413(x2), r13=30(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 147
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 71
LDI r12, 413
LDI r13, 30
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
