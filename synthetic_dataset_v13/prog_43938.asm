; DESCRIPTION: Renders a white line between points (406, 219) and (149, 208).
; PLAN: r0=406(x1), r1=219(y1), r2=149(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 219
LDI r2, 149
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
