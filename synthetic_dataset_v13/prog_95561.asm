; DESCRIPTION: Places a blue line segment connecting (460, 98) to (89, 52).
; PLAN: r0=460(x1), r1=98(y1), r2=89(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 98
LDI r2, 89
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
