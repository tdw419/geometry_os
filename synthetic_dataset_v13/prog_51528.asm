; DESCRIPTION: Places a purple line segment connecting (66, 14) to (286, 125).
; PLAN: r0=66(x1), r1=14(y1), r2=286(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 14
LDI r2, 286
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
