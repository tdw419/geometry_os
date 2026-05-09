; DESCRIPTION: Draws a blue line from (185, 116) to (474, 171).
; PLAN: r0=185(x1), r1=116(y1), r2=474(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 116
LDI r2, 474
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
