; DESCRIPTION: Places a green line segment connecting (428, 93) to (497, 239).
; PLAN: r0=428(x1), r1=93(y1), r2=497(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 93
LDI r2, 497
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
