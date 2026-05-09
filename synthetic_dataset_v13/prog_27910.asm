; DESCRIPTION: Places a green line segment connecting (103, 216) to (218, 19).
; PLAN: r0=103(x1), r1=216(y1), r2=218(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 216
LDI r2, 218
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
