; DESCRIPTION: Draws a green line from (278, 212) to (24, 184).
; PLAN: r0=278(x1), r1=212(y1), r2=24(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 212
LDI r2, 24
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
