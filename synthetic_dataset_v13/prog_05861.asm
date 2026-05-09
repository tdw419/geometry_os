; DESCRIPTION: Places a white line segment connecting (94, 83) to (50, 32).
; PLAN: r0=94(x1), r1=83(y1), r2=50(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 83
LDI r2, 50
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
