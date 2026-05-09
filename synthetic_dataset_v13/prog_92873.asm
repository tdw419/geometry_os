; DESCRIPTION: Renders a green line between points (347, 204) and (149, 57).
; PLAN: r0=347(x1), r1=204(y1), r2=149(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 204
LDI r2, 149
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
