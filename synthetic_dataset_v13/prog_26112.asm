; DESCRIPTION: Draws a green line from (114, 112) to (143, 110).
; PLAN: r0=114(x1), r1=112(y1), r2=143(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 112
LDI r2, 143
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
