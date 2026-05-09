; DESCRIPTION: Places a white line segment connecting (349, 0) to (57, 12).
; PLAN: r0=349(x1), r1=0(y1), r2=57(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 0
LDI r2, 57
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
