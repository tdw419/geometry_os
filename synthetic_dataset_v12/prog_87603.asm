; DESCRIPTION: Places a white line segment connecting (255, 51) to (286, 61).
; PLAN: r0=255(x1), r1=51(y1), r2=286(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 51
LDI r2, 286
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
