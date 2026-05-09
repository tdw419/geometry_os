; DESCRIPTION: Composite: Renders a green box of size 81x36 starting at (409, 19) then Places a white dot at position (400, 10) then Draws a magenta line from (66, 106) to (413, 184).
; PLAN: r0=409(x), r1=19(y), r2=81(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=10(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=106(y1), r12=413(x2), r13=184(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 19
LDI r2, 81
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 10
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 106
LDI r12, 413
LDI r13, 184
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
