; DESCRIPTION: Renders a blue line between points (40, 234) and (135, 166).
; PLAN: r0=40(x1), r1=234(y1), r2=135(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 234
LDI r2, 135
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
