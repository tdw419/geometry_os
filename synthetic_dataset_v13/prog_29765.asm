; DESCRIPTION: Renders a green line between points (287, 106) and (26, 19).
; PLAN: r0=287(x1), r1=106(y1), r2=26(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 106
LDI r2, 26
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
