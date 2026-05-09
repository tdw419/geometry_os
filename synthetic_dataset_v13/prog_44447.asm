; DESCRIPTION: Draws a red line from (159, 232) to (392, 189).
; PLAN: r0=159(x1), r1=232(y1), r2=392(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 232
LDI r2, 392
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
