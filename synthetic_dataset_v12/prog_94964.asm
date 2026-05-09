; DESCRIPTION: Places a blue line segment connecting (333, 25) to (107, 12).
; PLAN: r0=333(x1), r1=25(y1), r2=107(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 25
LDI r2, 107
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
