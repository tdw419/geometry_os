; DESCRIPTION: Places a blue line segment connecting (25, 55) to (19, 236).
; PLAN: r0=25(x1), r1=55(y1), r2=19(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 55
LDI r2, 19
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
