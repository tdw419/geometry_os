; DESCRIPTION: Draws a yellow line from (105, 161) to (142, 75).
; PLAN: r0=105(x1), r1=161(y1), r2=142(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 161
LDI r2, 142
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
