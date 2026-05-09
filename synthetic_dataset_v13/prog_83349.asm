; DESCRIPTION: Draws a magenta line from (286, 74) to (148, 246).
; PLAN: r0=286(x1), r1=74(y1), r2=148(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 74
LDI r2, 148
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
