; DESCRIPTION: Composite: Draws a white line from (305, 181) to (22, 171) then Sets a single blue pixel at (185, 198).
; PLAN: r0=305(x1), r1=181(y1), r2=22(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 181
LDI r2, 22
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
