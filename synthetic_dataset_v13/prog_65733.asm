; DESCRIPTION: Draws a black line from (247, 252) to (131, 133).
; PLAN: r0=247(x1), r1=252(y1), r2=131(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 252
LDI r2, 131
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
