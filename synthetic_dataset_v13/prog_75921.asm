; DESCRIPTION: Places a magenta line segment connecting (36, 74) to (426, 172).
; PLAN: r0=36(x1), r1=74(y1), r2=426(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 74
LDI r2, 426
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
