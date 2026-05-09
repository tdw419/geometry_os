; DESCRIPTION: Places a white line segment connecting (471, 17) to (354, 220).
; PLAN: r0=471(x1), r1=17(y1), r2=354(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 17
LDI r2, 354
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
