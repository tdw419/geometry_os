; DESCRIPTION: Renders a green line between points (428, 84) and (200, 125).
; PLAN: r0=428(x1), r1=84(y1), r2=200(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 84
LDI r2, 200
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
