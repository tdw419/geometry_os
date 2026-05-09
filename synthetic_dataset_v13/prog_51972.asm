; DESCRIPTION: Composite: Places a orange dot at position (127, 158) then Places a magenta line segment connecting (418, 90) to (470, 204) then Places a purple 97x81 rectangle at position (177, 35).
; PLAN: r0=127(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=418(x1), r6=90(y1), r7=470(x2), r8=204(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=35(y), r12=97(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 158
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 418
LDI r6, 90
LDI r7, 470
LDI r8, 204
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 35
LDI r12, 97
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
