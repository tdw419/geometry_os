; DESCRIPTION: Places a magenta line segment connecting (109, 83) to (330, 182).
; PLAN: r0=109(x1), r1=83(y1), r2=330(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 83
LDI r2, 330
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
