; DESCRIPTION: Places a black line segment connecting (165, 204) to (195, 60).
; PLAN: r0=165(x1), r1=204(y1), r2=195(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 204
LDI r2, 195
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
