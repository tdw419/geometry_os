; DESCRIPTION: Draws a blue line from (56, 164) to (138, 71).
; PLAN: r0=56(x1), r1=164(y1), r2=138(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 164
LDI r2, 138
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
