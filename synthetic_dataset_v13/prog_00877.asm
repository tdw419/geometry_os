; DESCRIPTION: Draws a black line from (391, 148) to (199, 167).
; PLAN: r0=391(x1), r1=148(y1), r2=199(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 148
LDI r2, 199
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
