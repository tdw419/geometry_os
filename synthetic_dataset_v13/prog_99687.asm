; DESCRIPTION: Draws a blue line from (457, 238) to (183, 126).
; PLAN: r0=457(x1), r1=238(y1), r2=183(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 238
LDI r2, 183
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
