; DESCRIPTION: Places a blue line segment connecting (425, 137) to (127, 38).
; PLAN: r0=425(x1), r1=137(y1), r2=127(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 137
LDI r2, 127
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
