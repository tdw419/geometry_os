; DESCRIPTION: Composite: Places a yellow dot at position (400, 62) then Places a black line segment connecting (310, 235) to (273, 86) then Draws a green rectangle at (356, 51) with width 113 and height 90.
; PLAN: r0=400(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=235(y1), r7=273(x2), r8=86(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=51(y), r12=113(width), r13=90(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 310
LDI r6, 235
LDI r7, 273
LDI r8, 86
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 51
LDI r12, 113
LDI r13, 90
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
