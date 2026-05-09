; DESCRIPTION: Draws a green line from (6, 162) to (143, 141).
; PLAN: r0=6(x1), r1=162(y1), r2=143(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 162
LDI r2, 143
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
