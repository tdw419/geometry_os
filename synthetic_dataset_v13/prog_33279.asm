; DESCRIPTION: Draws a green line from (484, 209) to (169, 205).
; PLAN: r0=484(x1), r1=209(y1), r2=169(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 209
LDI r2, 169
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
