; DESCRIPTION: Places a purple line segment connecting (111, 103) to (6, 143).
; PLAN: r0=111(x1), r1=103(y1), r2=6(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 103
LDI r2, 6
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
