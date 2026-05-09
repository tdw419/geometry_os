; DESCRIPTION: Renders a green line between points (63, 170) and (267, 227).
; PLAN: r0=63(x1), r1=170(y1), r2=267(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 170
LDI r2, 267
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
