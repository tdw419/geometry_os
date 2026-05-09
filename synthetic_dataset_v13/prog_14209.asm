; DESCRIPTION: Places a magenta line segment connecting (70, 187) to (282, 238).
; PLAN: r0=70(x1), r1=187(y1), r2=282(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 187
LDI r2, 282
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
