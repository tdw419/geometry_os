; DESCRIPTION: Places a green line segment connecting (408, 132) to (227, 51).
; PLAN: r0=408(x1), r1=132(y1), r2=227(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 132
LDI r2, 227
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
