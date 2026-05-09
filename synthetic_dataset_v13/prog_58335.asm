; DESCRIPTION: Draws a blue line from (138, 102) to (21, 98).
; PLAN: r0=138(x1), r1=102(y1), r2=21(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 102
LDI r2, 21
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
