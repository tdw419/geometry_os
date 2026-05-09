; DESCRIPTION: Places a blue line segment connecting (468, 246) to (206, 171).
; PLAN: r0=468(x1), r1=246(y1), r2=206(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 246
LDI r2, 206
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
