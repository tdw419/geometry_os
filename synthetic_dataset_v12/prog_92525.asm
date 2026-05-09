; DESCRIPTION: Renders a magenta line between points (324, 23) and (333, 67).
; PLAN: r0=324(x1), r1=23(y1), r2=333(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 23
LDI r2, 333
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
