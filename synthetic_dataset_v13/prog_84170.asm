; DESCRIPTION: Composite: Places a black dot at position (40, 54) then Draws a purple rectangle at (297, 132) with width 26 and height 50 then Renders a magenta line between points (148, 168) and (451, 62).
; PLAN: r0=40(x), r1=54(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=132(y), r7=26(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=148(x1), r11=168(y1), r12=451(x2), r13=62(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 54
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 297
LDI r6, 132
LDI r7, 26
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 168
LDI r12, 451
LDI r13, 62
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
