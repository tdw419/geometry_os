; DESCRIPTION: Renders a green line between points (120, 204) and (125, 65).
; PLAN: r0=120(x1), r1=204(y1), r2=125(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 204
LDI r2, 125
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
