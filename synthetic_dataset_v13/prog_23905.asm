; DESCRIPTION: Renders a green line between points (472, 66) and (267, 18).
; PLAN: r0=472(x1), r1=66(y1), r2=267(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 66
LDI r2, 267
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
