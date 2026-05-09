; DESCRIPTION: Places a blue line segment connecting (281, 39) to (250, 114).
; PLAN: r0=281(x1), r1=39(y1), r2=250(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 39
LDI r2, 250
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
