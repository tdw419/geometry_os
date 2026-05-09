; DESCRIPTION: Renders a orange line between points (433, 181) and (256, 221).
; PLAN: r0=433(x1), r1=181(y1), r2=256(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 181
LDI r2, 256
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
