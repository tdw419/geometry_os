; DESCRIPTION: Composite: Sets a single blue pixel at (373, 233) then Renders a yellow box of size 89x113 starting at (356, 91) then Draws a orange line from (279, 235) to (154, 122).
; PLAN: r0=373(x), r1=233(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=91(y), r7=89(width), r8=113(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=279(x1), r11=235(y1), r12=154(x2), r13=122(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 233
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 91
LDI r7, 89
LDI r8, 113
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 235
LDI r12, 154
LDI r13, 122
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
