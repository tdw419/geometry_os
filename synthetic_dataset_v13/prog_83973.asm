; DESCRIPTION: Renders a green line between points (168, 55) and (448, 135).
; PLAN: r0=168(x1), r1=55(y1), r2=448(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 55
LDI r2, 448
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
