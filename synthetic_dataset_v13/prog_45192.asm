; DESCRIPTION: Composite: Places a blue dot at position (433, 67) then Draws a magenta line from (161, 181) to (129, 6) then Places a purple circle of radius 68 at center (320, 161).
; PLAN: r0=433(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=181(y1), r7=129(x2), r8=6(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=161(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 181
LDI r7, 129
LDI r8, 6
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 161
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
