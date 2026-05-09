; DESCRIPTION: Places a green line segment connecting (401, 140) to (364, 90).
; PLAN: r0=401(x1), r1=140(y1), r2=364(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 140
LDI r2, 364
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
