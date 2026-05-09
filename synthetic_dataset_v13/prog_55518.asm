; DESCRIPTION: Places a blue line segment connecting (286, 139) to (144, 107).
; PLAN: r0=286(x1), r1=139(y1), r2=144(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 139
LDI r2, 144
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
