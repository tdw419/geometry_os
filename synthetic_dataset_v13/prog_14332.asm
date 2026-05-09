; DESCRIPTION: Draws a blue line from (343, 73) to (507, 71).
; PLAN: r0=343(x1), r1=73(y1), r2=507(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 73
LDI r2, 507
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
