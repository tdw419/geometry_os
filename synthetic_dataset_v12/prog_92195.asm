; DESCRIPTION: Composite: Places a blue 89x79 rectangle at position (166, 90) then Places a magenta dot at position (88, 201) then Renders a black line between points (404, 180) and (432, 231).
; PLAN: r0=166(x), r1=90(y), r2=89(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=201(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=404(x1), r11=180(y1), r12=432(x2), r13=231(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 90
LDI r2, 89
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 201
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 180
LDI r12, 432
LDI r13, 231
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
