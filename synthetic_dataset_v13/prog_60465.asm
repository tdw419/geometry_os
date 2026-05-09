; DESCRIPTION: Renders a orange line between points (411, 178) and (418, 221).
; PLAN: r0=411(x1), r1=178(y1), r2=418(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 178
LDI r2, 418
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
