; DESCRIPTION: Composite: Places a blue 47x111 rectangle at position (444, 103) then Places a purple dot at position (46, 133) then Draws a yellow line from (253, 51) to (8, 201).
; PLAN: r0=444(x), r1=103(y), r2=47(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x), r6=133(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=253(x1), r11=51(y1), r12=8(x2), r13=201(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 103
LDI r2, 47
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 133
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 253
LDI r11, 51
LDI r12, 8
LDI r13, 201
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
