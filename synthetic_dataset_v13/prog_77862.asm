; DESCRIPTION: Places a magenta line segment connecting (425, 178) to (413, 135).
; PLAN: r0=425(x1), r1=178(y1), r2=413(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 178
LDI r2, 413
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
