; DESCRIPTION: Renders a green line between points (82, 147) and (500, 5).
; PLAN: r0=82(x1), r1=147(y1), r2=500(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 147
LDI r2, 500
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
