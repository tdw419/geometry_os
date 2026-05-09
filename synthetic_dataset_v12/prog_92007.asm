; DESCRIPTION: Renders a green line between points (191, 58) and (265, 75).
; PLAN: r0=191(x1), r1=58(y1), r2=265(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 58
LDI r2, 265
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
