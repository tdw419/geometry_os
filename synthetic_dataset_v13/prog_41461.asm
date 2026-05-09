; DESCRIPTION: Places a white line segment connecting (91, 49) to (359, 125).
; PLAN: r0=91(x1), r1=49(y1), r2=359(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 49
LDI r2, 359
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
