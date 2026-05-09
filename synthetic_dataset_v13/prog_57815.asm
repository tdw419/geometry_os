; DESCRIPTION: Places a green line segment connecting (428, 172) to (6, 177).
; PLAN: r0=428(x1), r1=172(y1), r2=6(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 172
LDI r2, 6
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
