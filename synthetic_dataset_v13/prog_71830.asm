; DESCRIPTION: Draws a magenta line from (478, 102) to (196, 93).
; PLAN: r0=478(x1), r1=102(y1), r2=196(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 102
LDI r2, 196
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
