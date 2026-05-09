; DESCRIPTION: Renders a green line between points (427, 174) and (125, 76).
; PLAN: r0=427(x1), r1=174(y1), r2=125(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 174
LDI r2, 125
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
