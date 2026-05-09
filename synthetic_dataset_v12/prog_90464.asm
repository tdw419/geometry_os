; DESCRIPTION: Draws a yellow line from (105, 180) to (93, 134).
; PLAN: r0=105(x1), r1=180(y1), r2=93(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 180
LDI r2, 93
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
