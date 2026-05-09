; DESCRIPTION: Draws a blue line from (313, 194) to (70, 172).
; PLAN: r0=313(x1), r1=194(y1), r2=70(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 194
LDI r2, 70
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
