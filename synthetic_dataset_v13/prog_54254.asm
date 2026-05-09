; DESCRIPTION: Places a blue line segment connecting (349, 59) to (282, 174).
; PLAN: r0=349(x1), r1=59(y1), r2=282(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 59
LDI r2, 282
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
