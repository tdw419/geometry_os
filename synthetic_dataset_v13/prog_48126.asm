; DESCRIPTION: Composite: Places a blue dot at position (253, 187) then Draws a green line from (180, 227) to (165, 199) then Renders a magenta box of size 64x113 starting at (68, 79).
; PLAN: r0=253(x), r1=187(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=180(x1), r6=227(y1), r7=165(x2), r8=199(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=79(y), r12=64(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 187
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 180
LDI r6, 227
LDI r7, 165
LDI r8, 199
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 79
LDI r12, 64
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
