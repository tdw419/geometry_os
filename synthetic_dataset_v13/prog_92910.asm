; DESCRIPTION: Places a blue line segment connecting (487, 150) to (322, 230).
; PLAN: r0=487(x1), r1=150(y1), r2=322(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 150
LDI r2, 322
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
