; DESCRIPTION: Renders a green line between points (178, 85) and (500, 120).
; PLAN: r0=178(x1), r1=85(y1), r2=500(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 85
LDI r2, 500
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
