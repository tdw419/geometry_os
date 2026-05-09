; DESCRIPTION: Renders a yellow line between points (20, 9) and (411, 180).
; PLAN: r0=20(x1), r1=9(y1), r2=411(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 9
LDI r2, 411
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
