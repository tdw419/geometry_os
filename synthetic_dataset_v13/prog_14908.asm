; DESCRIPTION: Renders a blue line between points (166, 60) and (503, 72).
; PLAN: r0=166(x1), r1=60(y1), r2=503(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 60
LDI r2, 503
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
