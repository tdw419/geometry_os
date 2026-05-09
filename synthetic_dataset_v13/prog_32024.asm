; DESCRIPTION: Composite: Draws a black rectangle at (404, 53) with width 62 and height 107 then Draws a orange line from (243, 227) to (235, 8) then Draws a black circle centered at (160, 131) with radius 61.
; PLAN: r0=404(x), r1=53(y), r2=62(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x1), r6=227(y1), r7=235(x2), r8=8(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=131(y), r12=61(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 404
LDI r1, 53
LDI r2, 62
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 227
LDI r7, 235
LDI r8, 8
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 131
LDI r12, 61
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
