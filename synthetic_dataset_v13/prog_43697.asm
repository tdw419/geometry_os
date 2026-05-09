; DESCRIPTION: Draws a blue line from (300, 114) to (291, 131).
; PLAN: r0=300(x1), r1=114(y1), r2=291(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 114
LDI r2, 291
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
