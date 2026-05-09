; DESCRIPTION: Places a yellow line segment connecting (159, 164) to (221, 161).
; PLAN: r0=159(x1), r1=164(y1), r2=221(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 164
LDI r2, 221
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
