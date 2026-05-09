; DESCRIPTION: Places a magenta line segment connecting (197, 179) to (342, 75).
; PLAN: r0=197(x1), r1=179(y1), r2=342(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 179
LDI r2, 342
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
