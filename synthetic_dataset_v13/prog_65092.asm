; DESCRIPTION: Draws a magenta line from (182, 53) to (126, 157).
; PLAN: r0=182(x1), r1=53(y1), r2=126(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 53
LDI r2, 126
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
