; DESCRIPTION: Places a white line segment connecting (43, 192) to (70, 192).
; PLAN: r0=43(x1), r1=192(y1), r2=70(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 192
LDI r2, 70
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
