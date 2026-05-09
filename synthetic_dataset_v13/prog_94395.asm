; DESCRIPTION: Renders a green line between points (374, 109) and (403, 85).
; PLAN: r0=374(x1), r1=109(y1), r2=403(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 109
LDI r2, 403
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
