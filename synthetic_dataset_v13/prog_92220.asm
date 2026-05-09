; DESCRIPTION: Places a magenta line segment connecting (313, 233) to (226, 64).
; PLAN: r0=313(x1), r1=233(y1), r2=226(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 233
LDI r2, 226
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
