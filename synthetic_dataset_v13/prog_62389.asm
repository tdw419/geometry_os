; DESCRIPTION: Places a magenta line segment connecting (456, 111) to (36, 25).
; PLAN: r0=456(x1), r1=111(y1), r2=36(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 111
LDI r2, 36
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
