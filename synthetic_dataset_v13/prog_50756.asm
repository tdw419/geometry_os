; DESCRIPTION: Places a green line segment connecting (157, 159) to (77, 125).
; PLAN: r0=157(x1), r1=159(y1), r2=77(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 159
LDI r2, 77
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
