; DESCRIPTION: Draws a blue line from (420, 7) to (194, 172).
; PLAN: r0=420(x1), r1=7(y1), r2=194(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 7
LDI r2, 194
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
