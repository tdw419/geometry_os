; DESCRIPTION: Renders a green line between points (125, 108) and (448, 29).
; PLAN: r0=125(x1), r1=108(y1), r2=448(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 108
LDI r2, 448
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
