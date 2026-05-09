; DESCRIPTION: Places a cyan line segment connecting (200, 139) to (400, 142).
; PLAN: r0=200(x1), r1=139(y1), r2=400(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 139
LDI r2, 400
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
