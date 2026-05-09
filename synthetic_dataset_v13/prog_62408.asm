; DESCRIPTION: Renders a blue line between points (492, 168) and (200, 246).
; PLAN: r0=492(x1), r1=168(y1), r2=200(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 168
LDI r2, 200
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
