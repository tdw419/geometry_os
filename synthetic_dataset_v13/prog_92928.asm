; DESCRIPTION: Places a magenta line segment connecting (327, 20) to (262, 73).
; PLAN: r0=327(x1), r1=20(y1), r2=262(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 20
LDI r2, 262
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
