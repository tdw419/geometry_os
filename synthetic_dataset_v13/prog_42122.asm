; DESCRIPTION: Places a white line segment connecting (420, 192) to (475, 127).
; PLAN: r0=420(x1), r1=192(y1), r2=475(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 192
LDI r2, 475
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
