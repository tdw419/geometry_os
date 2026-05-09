; DESCRIPTION: Draws a green line from (85, 184) to (226, 58).
; PLAN: r0=85(x1), r1=184(y1), r2=226(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 184
LDI r2, 226
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
