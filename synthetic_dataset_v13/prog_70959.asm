; DESCRIPTION: Draws a blue line from (313, 207) to (435, 36).
; PLAN: r0=313(x1), r1=207(y1), r2=435(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 207
LDI r2, 435
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
