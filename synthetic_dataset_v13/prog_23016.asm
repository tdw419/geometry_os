; DESCRIPTION: Renders a green line between points (487, 245) and (155, 54).
; PLAN: r0=487(x1), r1=245(y1), r2=155(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 245
LDI r2, 155
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
