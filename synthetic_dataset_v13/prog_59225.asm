; DESCRIPTION: Renders a green line between points (26, 225) and (38, 254).
; PLAN: r0=26(x1), r1=225(y1), r2=38(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 225
LDI r2, 38
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
