; DESCRIPTION: Renders a red line between points (243, 115) and (36, 20).
; PLAN: r0=243(x1), r1=115(y1), r2=36(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 115
LDI r2, 36
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
