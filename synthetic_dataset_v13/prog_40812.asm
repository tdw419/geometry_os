; DESCRIPTION: Places a white line segment connecting (90, 248) to (483, 222).
; PLAN: r0=90(x1), r1=248(y1), r2=483(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 248
LDI r2, 483
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
