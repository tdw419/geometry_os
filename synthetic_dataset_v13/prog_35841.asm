; DESCRIPTION: Renders a blue line between points (111, 80) and (20, 236).
; PLAN: r0=111(x1), r1=80(y1), r2=20(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 80
LDI r2, 20
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
