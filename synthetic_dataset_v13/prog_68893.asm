; DESCRIPTION: Places a yellow line segment connecting (93, 204) to (445, 200).
; PLAN: r0=93(x1), r1=204(y1), r2=445(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 204
LDI r2, 445
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
