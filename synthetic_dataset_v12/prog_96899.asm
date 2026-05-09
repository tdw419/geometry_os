; DESCRIPTION: Places a white line segment connecting (109, 202) to (1, 239).
; PLAN: r0=109(x1), r1=202(y1), r2=1(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 202
LDI r2, 1
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
