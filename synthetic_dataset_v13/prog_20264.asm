; DESCRIPTION: Draws a black line from (128, 23) to (149, 212).
; PLAN: r0=128(x1), r1=23(y1), r2=149(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 23
LDI r2, 149
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
