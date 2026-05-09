; DESCRIPTION: Places a white line segment connecting (293, 240) to (381, 180).
; PLAN: r0=293(x1), r1=240(y1), r2=381(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 240
LDI r2, 381
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
