; DESCRIPTION: Places a white line segment connecting (22, 159) to (220, 66).
; PLAN: r0=22(x1), r1=159(y1), r2=220(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 159
LDI r2, 220
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
