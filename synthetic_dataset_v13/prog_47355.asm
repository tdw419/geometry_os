; DESCRIPTION: Places a magenta line segment connecting (411, 47) to (411, 132).
; PLAN: r0=411(x1), r1=47(y1), r2=411(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 47
LDI r2, 411
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
