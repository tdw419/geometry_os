; DESCRIPTION: Places a yellow line segment connecting (349, 97) to (381, 125).
; PLAN: r0=349(x1), r1=97(y1), r2=381(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 97
LDI r2, 381
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
