; DESCRIPTION: Composite: Draws a magenta line from (267, 50) to (41, 0) then Places a blue dot at position (419, 187) then Renders a white disk with center (308, 88) and radius 50.
; PLAN: r0=267(x1), r1=50(y1), r2=41(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=187(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=308(x), r11=88(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 50
LDI r2, 41
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 187
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 308
LDI r11, 88
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
