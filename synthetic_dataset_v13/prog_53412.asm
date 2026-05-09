; DESCRIPTION: Places a blue line segment connecting (210, 221) to (427, 87).
; PLAN: r0=210(x1), r1=221(y1), r2=427(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 221
LDI r2, 427
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
