; DESCRIPTION: Draws a blue line from (69, 113) to (233, 187).
; PLAN: r0=69(x1), r1=113(y1), r2=233(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 113
LDI r2, 233
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
