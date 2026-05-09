; DESCRIPTION: Renders a blue line between points (502, 11) and (106, 48).
; PLAN: r0=502(x1), r1=11(y1), r2=106(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 11
LDI r2, 106
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
