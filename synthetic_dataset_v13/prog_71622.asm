; DESCRIPTION: Composite: Places a blue line segment connecting (117, 221) to (132, 238) then Places a red dot at position (154, 23) then Places a orange circle of radius 24 at center (308, 109).
; PLAN: r0=117(x1), r1=221(y1), r2=132(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=23(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=308(x), r11=109(y), r12=24(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 221
LDI r2, 132
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 23
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 308
LDI r11, 109
LDI r12, 24
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
