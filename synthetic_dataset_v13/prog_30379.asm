; DESCRIPTION: Places a white line segment connecting (192, 205) to (360, 52).
; PLAN: r0=192(x1), r1=205(y1), r2=360(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 205
LDI r2, 360
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
