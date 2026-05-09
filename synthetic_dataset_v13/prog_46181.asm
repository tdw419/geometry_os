; DESCRIPTION: Places a yellow line segment connecting (322, 130) to (75, 61).
; PLAN: r0=322(x1), r1=130(y1), r2=75(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 130
LDI r2, 75
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
