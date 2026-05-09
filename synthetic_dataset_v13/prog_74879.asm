; DESCRIPTION: Places a black line segment connecting (362, 74) to (409, 56).
; PLAN: r0=362(x1), r1=74(y1), r2=409(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 74
LDI r2, 409
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
