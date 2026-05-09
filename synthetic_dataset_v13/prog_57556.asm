; DESCRIPTION: Composite: Places a black dot at position (85, 133) then Draws a yellow rectangle at (33, 103) with width 74 and height 10 then Renders a purple line between points (237, 187) and (441, 54).
; PLAN: r0=85(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=103(y), r7=74(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=237(x1), r11=187(y1), r12=441(x2), r13=54(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 33
LDI r6, 103
LDI r7, 74
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 187
LDI r12, 441
LDI r13, 54
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
