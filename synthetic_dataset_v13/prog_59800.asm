; DESCRIPTION: Places a magenta line segment connecting (429, 221) to (322, 75).
; PLAN: r0=429(x1), r1=221(y1), r2=322(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 221
LDI r2, 322
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
