; DESCRIPTION: Places a magenta line segment connecting (409, 121) to (60, 24).
; PLAN: r0=409(x1), r1=121(y1), r2=60(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 121
LDI r2, 60
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
