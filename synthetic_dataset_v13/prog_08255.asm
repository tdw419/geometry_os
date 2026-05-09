; DESCRIPTION: Composite: Places a yellow dot at position (331, 102) then Renders a orange box of size 104x107 starting at (378, 132) then Draws a yellow line from (317, 189) to (462, 207).
; PLAN: r0=331(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=378(x), r6=132(y), r7=104(width), r8=107(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x1), r11=189(y1), r12=462(x2), r13=207(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 102
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 378
LDI r6, 132
LDI r7, 104
LDI r8, 107
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 189
LDI r12, 462
LDI r13, 207
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
