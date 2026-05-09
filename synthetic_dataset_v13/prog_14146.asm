; DESCRIPTION: Renders a blue line between points (135, 236) and (236, 33).
; PLAN: r0=135(x1), r1=236(y1), r2=236(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 236
LDI r2, 236
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
