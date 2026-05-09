; DESCRIPTION: Composite: Sets a single green pixel at (232, 179) then Draws a black line from (11, 66) to (227, 174) then Places a yellow 108x27 rectangle at position (148, 106).
; PLAN: r0=232(x), r1=179(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=11(x1), r6=66(y1), r7=227(x2), r8=174(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=106(y), r12=108(width), r13=27(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 179
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 11
LDI r6, 66
LDI r7, 227
LDI r8, 174
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 106
LDI r12, 108
LDI r13, 27
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
