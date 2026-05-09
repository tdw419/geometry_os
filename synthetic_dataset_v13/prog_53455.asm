; DESCRIPTION: Places a white line segment connecting (358, 212) to (130, 239).
; PLAN: r0=358(x1), r1=212(y1), r2=130(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 212
LDI r2, 130
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
