; DESCRIPTION: Composite: Creates a blue circular shape at (226, 119) with radius 36 then Places a red 60x96 rectangle at position (241, 127) then Draws a magenta line from (429, 11) to (77, 105).
; PLAN: r0=226(x), r1=119(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=127(y), r7=60(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=429(x1), r11=11(y1), r12=77(x2), r13=105(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 226
LDI r1, 119
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 127
LDI r7, 60
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 11
LDI r12, 77
LDI r13, 105
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
