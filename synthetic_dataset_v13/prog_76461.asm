; DESCRIPTION: Draws a magenta line from (413, 38) to (40, 162).
; PLAN: r0=413(x1), r1=38(y1), r2=40(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 38
LDI r2, 40
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
