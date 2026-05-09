; DESCRIPTION: Composite: Draws a blue line from (317, 61) to (377, 171) then Sets a single black pixel at (339, 221) then Draws a blue circle centered at (169, 206) with radius 13.
; PLAN: r0=317(x1), r1=61(y1), r2=377(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=169(x), r11=206(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 317
LDI r1, 61
LDI r2, 377
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 169
LDI r11, 206
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
