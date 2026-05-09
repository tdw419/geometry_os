; DESCRIPTION: Renders a green line between points (367, 62) and (260, 78).
; PLAN: r0=367(x1), r1=62(y1), r2=260(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 62
LDI r2, 260
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
