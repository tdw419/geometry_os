; DESCRIPTION: Draws a blue line from (480, 142) to (20, 71).
; PLAN: r0=480(x1), r1=142(y1), r2=20(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 142
LDI r2, 20
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
