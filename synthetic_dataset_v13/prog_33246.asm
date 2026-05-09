; DESCRIPTION: Places a green line segment connecting (267, 13) to (77, 81).
; PLAN: r0=267(x1), r1=13(y1), r2=77(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 13
LDI r2, 77
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
