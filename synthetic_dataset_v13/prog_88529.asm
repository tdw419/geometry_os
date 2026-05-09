; DESCRIPTION: Places a green line segment connecting (477, 196) to (362, 84).
; PLAN: r0=477(x1), r1=196(y1), r2=362(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 196
LDI r2, 362
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
