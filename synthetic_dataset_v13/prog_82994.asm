; DESCRIPTION: Places a black line segment connecting (199, 39) to (334, 209).
; PLAN: r0=199(x1), r1=39(y1), r2=334(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 39
LDI r2, 334
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
