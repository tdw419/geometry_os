; DESCRIPTION: Places a magenta line segment connecting (105, 140) to (197, 254).
; PLAN: r0=105(x1), r1=140(y1), r2=197(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 140
LDI r2, 197
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
