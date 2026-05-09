; DESCRIPTION: Renders a green line between points (121, 50) and (249, 105).
; PLAN: r0=121(x1), r1=50(y1), r2=249(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 50
LDI r2, 249
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
