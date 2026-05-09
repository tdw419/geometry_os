; DESCRIPTION: Draws a green line from (452, 121) to (463, 6).
; PLAN: r0=452(x1), r1=121(y1), r2=463(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 121
LDI r2, 463
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
