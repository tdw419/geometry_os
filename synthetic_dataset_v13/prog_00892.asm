; DESCRIPTION: Draws a blue line from (67, 103) to (216, 61).
; PLAN: r0=67(x1), r1=103(y1), r2=216(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 103
LDI r2, 216
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
