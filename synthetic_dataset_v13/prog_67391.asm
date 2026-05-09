; DESCRIPTION: Draws a blue line from (343, 237) to (76, 195).
; PLAN: r0=343(x1), r1=237(y1), r2=76(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 237
LDI r2, 76
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
