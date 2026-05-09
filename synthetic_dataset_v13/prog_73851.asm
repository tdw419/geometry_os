; DESCRIPTION: Places a magenta line segment connecting (21, 27) to (423, 32).
; PLAN: r0=21(x1), r1=27(y1), r2=423(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 27
LDI r2, 423
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
