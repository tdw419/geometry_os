; DESCRIPTION: Renders a green line between points (50, 169) and (487, 9).
; PLAN: r0=50(x1), r1=169(y1), r2=487(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 169
LDI r2, 487
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
