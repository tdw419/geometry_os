; DESCRIPTION: Draws a black line from (403, 53) to (193, 212).
; PLAN: r0=403(x1), r1=53(y1), r2=193(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 53
LDI r2, 193
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
