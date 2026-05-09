; DESCRIPTION: Renders a green line between points (183, 174) and (331, 91).
; PLAN: r0=183(x1), r1=174(y1), r2=331(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 174
LDI r2, 331
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
