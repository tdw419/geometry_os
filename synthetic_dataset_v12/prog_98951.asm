; DESCRIPTION: Renders a green line between points (0, 200) and (122, 76).
; PLAN: r0=0(x1), r1=200(y1), r2=122(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 200
LDI r2, 122
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
