; DESCRIPTION: Places a white line segment connecting (412, 87) to (17, 125).
; PLAN: r0=412(x1), r1=87(y1), r2=17(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 87
LDI r2, 17
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
