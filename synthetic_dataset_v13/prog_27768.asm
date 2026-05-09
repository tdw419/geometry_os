; DESCRIPTION: Places a white line segment connecting (141, 139) to (320, 200).
; PLAN: r0=141(x1), r1=139(y1), r2=320(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 139
LDI r2, 320
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
