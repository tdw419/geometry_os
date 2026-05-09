; DESCRIPTION: Places a white line segment connecting (421, 209) to (7, 180).
; PLAN: r0=421(x1), r1=209(y1), r2=7(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 209
LDI r2, 7
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
