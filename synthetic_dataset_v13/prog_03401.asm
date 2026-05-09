; DESCRIPTION: Places a green line segment connecting (46, 54) to (159, 4).
; PLAN: r0=46(x1), r1=54(y1), r2=159(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 54
LDI r2, 159
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
