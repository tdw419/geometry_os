; DESCRIPTION: Places a purple line segment connecting (409, 20) to (215, 91).
; PLAN: r0=409(x1), r1=20(y1), r2=215(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 20
LDI r2, 215
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
