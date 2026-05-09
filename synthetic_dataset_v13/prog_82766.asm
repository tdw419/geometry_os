; DESCRIPTION: Draws a blue line from (113, 138) to (207, 200).
; PLAN: r0=113(x1), r1=138(y1), r2=207(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 138
LDI r2, 207
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
