; DESCRIPTION: Composite: Places a blue dot at position (350, 131) then Draws a orange circle centered at (252, 235) with radius 18 then Places a cyan line segment connecting (66, 23) to (408, 199).
; PLAN: r0=350(x), r1=131(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=235(y), r7=18(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=66(x1), r11=23(y1), r12=408(x2), r13=199(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 131
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 235
LDI r7, 18
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 66
LDI r11, 23
LDI r12, 408
LDI r13, 199
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
