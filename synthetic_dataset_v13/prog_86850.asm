; DESCRIPTION: Draws a cyan line from (232, 227) to (105, 131).
; PLAN: r0=232(x1), r1=227(y1), r2=105(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 227
LDI r2, 105
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
