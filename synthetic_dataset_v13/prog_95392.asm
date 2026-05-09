; DESCRIPTION: Draws a magenta line from (53, 50) to (414, 115).
; PLAN: r0=53(x1), r1=50(y1), r2=414(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 50
LDI r2, 414
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
