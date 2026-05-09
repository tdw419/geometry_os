; DESCRIPTION: Draws a green line from (267, 119) to (194, 250).
; PLAN: r0=267(x1), r1=119(y1), r2=194(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 119
LDI r2, 194
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
