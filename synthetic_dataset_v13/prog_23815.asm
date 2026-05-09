; DESCRIPTION: Places a white line segment connecting (310, 189) to (324, 12).
; PLAN: r0=310(x1), r1=189(y1), r2=324(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 189
LDI r2, 324
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
