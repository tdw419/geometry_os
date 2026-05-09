; DESCRIPTION: Draws a green line from (399, 207) to (478, 67).
; PLAN: r0=399(x1), r1=207(y1), r2=478(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 207
LDI r2, 478
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
