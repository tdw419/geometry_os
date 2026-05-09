; DESCRIPTION: Draws a magenta line from (411, 1) to (207, 218).
; PLAN: r0=411(x1), r1=1(y1), r2=207(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 1
LDI r2, 207
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
