; DESCRIPTION: Renders a red line between points (287, 185) and (442, 44).
; PLAN: r0=287(x1), r1=185(y1), r2=442(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 185
LDI r2, 442
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
