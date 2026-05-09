; DESCRIPTION: Places a white line segment connecting (50, 94) to (44, 241).
; PLAN: r0=50(x1), r1=94(y1), r2=44(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 94
LDI r2, 44
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
