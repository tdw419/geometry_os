; DESCRIPTION: Draws a red line from (56, 25) to (258, 180).
; PLAN: r0=56(x1), r1=25(y1), r2=258(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 25
LDI r2, 258
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
