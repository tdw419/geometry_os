; DESCRIPTION: Places a cyan line segment connecting (124, 111) to (483, 203).
; PLAN: r0=124(x1), r1=111(y1), r2=483(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 111
LDI r2, 483
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
