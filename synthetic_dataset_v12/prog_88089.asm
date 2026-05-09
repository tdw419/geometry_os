; DESCRIPTION: Draws a green line from (343, 29) to (362, 34).
; PLAN: r0=343(x1), r1=29(y1), r2=362(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 29
LDI r2, 362
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
