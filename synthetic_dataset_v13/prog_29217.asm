; DESCRIPTION: Renders a green line between points (85, 96) and (200, 24).
; PLAN: r0=85(x1), r1=96(y1), r2=200(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 96
LDI r2, 200
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
