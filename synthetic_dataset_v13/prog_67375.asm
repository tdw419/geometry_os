; DESCRIPTION: Renders a red line between points (132, 140) and (160, 91).
; PLAN: r0=132(x1), r1=140(y1), r2=160(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 140
LDI r2, 160
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
