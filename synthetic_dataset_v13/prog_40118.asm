; DESCRIPTION: Renders a red line between points (159, 1) and (208, 150).
; PLAN: r0=159(x1), r1=1(y1), r2=208(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 1
LDI r2, 208
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
