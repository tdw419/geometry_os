; DESCRIPTION: Composite: Places a white dot at position (206, 143) then Draws a white line from (119, 251) to (471, 215) then Draws a magenta circle centered at (261, 147) with radius 69.
; PLAN: r0=206(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=251(y1), r7=471(x2), r8=215(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=147(y), r12=69(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 206
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 251
LDI r7, 471
LDI r8, 215
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 147
LDI r12, 69
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
