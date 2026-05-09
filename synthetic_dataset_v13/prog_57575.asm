; DESCRIPTION: Places a magenta line segment connecting (159, 36) to (344, 225).
; PLAN: r0=159(x1), r1=36(y1), r2=344(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 36
LDI r2, 344
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
