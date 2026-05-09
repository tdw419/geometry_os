; DESCRIPTION: Renders a green line between points (403, 2) and (211, 79).
; PLAN: r0=403(x1), r1=2(y1), r2=211(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 2
LDI r2, 211
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
