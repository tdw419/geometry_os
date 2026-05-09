; DESCRIPTION: Draws a magenta line from (507, 58) to (67, 148).
; PLAN: r0=507(x1), r1=58(y1), r2=67(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 58
LDI r2, 67
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
