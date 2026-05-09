; DESCRIPTION: Places a purple line segment connecting (238, 249) to (415, 55).
; PLAN: r0=238(x1), r1=249(y1), r2=415(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 249
LDI r2, 415
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
