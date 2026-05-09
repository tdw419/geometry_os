; DESCRIPTION: Renders a green line between points (174, 86) and (125, 120).
; PLAN: r0=174(x1), r1=86(y1), r2=125(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 86
LDI r2, 125
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
