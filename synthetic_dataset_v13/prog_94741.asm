; DESCRIPTION: Places a orange line segment connecting (264, 27) to (322, 97).
; PLAN: r0=264(x1), r1=27(y1), r2=322(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 27
LDI r2, 322
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
