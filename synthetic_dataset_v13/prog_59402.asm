; DESCRIPTION: Places a magenta line segment connecting (182, 143) to (372, 53).
; PLAN: r0=182(x1), r1=143(y1), r2=372(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 143
LDI r2, 372
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
