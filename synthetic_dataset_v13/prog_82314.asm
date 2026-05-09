; DESCRIPTION: Draws a blue line from (205, 32) to (343, 183).
; PLAN: r0=205(x1), r1=32(y1), r2=343(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 32
LDI r2, 343
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
