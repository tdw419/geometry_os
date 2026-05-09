; DESCRIPTION: Renders a yellow line between points (26, 44) and (398, 155).
; PLAN: r0=26(x1), r1=44(y1), r2=398(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 44
LDI r2, 398
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
