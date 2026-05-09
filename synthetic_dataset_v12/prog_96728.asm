; DESCRIPTION: Draws a black line from (67, 194) to (500, 106).
; PLAN: r0=67(x1), r1=194(y1), r2=500(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 194
LDI r2, 500
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
