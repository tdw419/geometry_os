; DESCRIPTION: Places a blue line segment connecting (7, 111) to (384, 194).
; PLAN: r0=7(x1), r1=111(y1), r2=384(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 111
LDI r2, 384
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
