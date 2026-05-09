; DESCRIPTION: Places a black line segment connecting (279, 111) to (301, 157).
; PLAN: r0=279(x1), r1=111(y1), r2=301(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 111
LDI r2, 301
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
