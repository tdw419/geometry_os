; DESCRIPTION: Renders a yellow line between points (244, 125) and (135, 57).
; PLAN: r0=244(x1), r1=125(y1), r2=135(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 125
LDI r2, 135
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
