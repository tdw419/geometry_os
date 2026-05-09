; DESCRIPTION: Draws a blue line from (274, 20) to (67, 173).
; PLAN: r0=274(x1), r1=20(y1), r2=67(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 20
LDI r2, 67
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
