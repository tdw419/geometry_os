; DESCRIPTION: Places a green line segment connecting (420, 34) to (400, 68).
; PLAN: r0=420(x1), r1=34(y1), r2=400(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 34
LDI r2, 400
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
