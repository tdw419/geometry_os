; DESCRIPTION: Composite: Sets a single green pixel at (45, 11) then Draws a black rectangle at (72, 235) with width 119 and height 11 then Draws a orange line from (104, 223) to (509, 55).
; PLAN: r0=45(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=235(y), r7=119(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x1), r11=223(y1), r12=509(x2), r13=55(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 72
LDI r6, 235
LDI r7, 119
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 223
LDI r12, 509
LDI r13, 55
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
