; DESCRIPTION: Draws a black line from (212, 115) to (45, 184).
; PLAN: r0=212(x1), r1=115(y1), r2=45(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 115
LDI r2, 45
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
