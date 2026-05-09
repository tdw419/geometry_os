; DESCRIPTION: Composite: Creates a magenta circular shape at (327, 33) with radius 33 then Sets a single black pixel at (456, 155) then Draws a blue line from (159, 212) to (445, 62).
; PLAN: r0=327(x), r1=33(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=155(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=159(x1), r11=212(y1), r12=445(x2), r13=62(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 327
LDI r1, 33
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 155
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 159
LDI r11, 212
LDI r12, 445
LDI r13, 62
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
