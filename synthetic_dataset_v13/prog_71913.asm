; DESCRIPTION: Draws a magenta line from (33, 2) to (61, 246).
; PLAN: r0=33(x1), r1=2(y1), r2=61(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 2
LDI r2, 61
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
