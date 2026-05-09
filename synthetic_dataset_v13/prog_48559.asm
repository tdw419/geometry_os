; DESCRIPTION: Places a magenta line segment connecting (74, 186) to (418, 197).
; PLAN: r0=74(x1), r1=186(y1), r2=418(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 186
LDI r2, 418
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
