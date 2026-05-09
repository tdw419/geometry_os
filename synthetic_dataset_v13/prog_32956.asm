; DESCRIPTION: Places a yellow line segment connecting (87, 201) to (239, 73).
; PLAN: r0=87(x1), r1=201(y1), r2=239(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 201
LDI r2, 239
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
