; DESCRIPTION: Draws a magenta line from (456, 183) to (413, 26).
; PLAN: r0=456(x1), r1=183(y1), r2=413(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 183
LDI r2, 413
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
