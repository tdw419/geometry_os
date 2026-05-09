; DESCRIPTION: Renders a green line between points (204, 204) and (37, 212).
; PLAN: r0=204(x1), r1=204(y1), r2=37(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 204
LDI r2, 37
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
