; DESCRIPTION: Draws a green line from (105, 109) to (204, 67).
; PLAN: r0=105(x1), r1=109(y1), r2=204(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 109
LDI r2, 204
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
