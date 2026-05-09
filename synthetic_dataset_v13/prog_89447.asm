; DESCRIPTION: Draws a white line from (151, 200) to (233, 30).
; PLAN: r0=151(x1), r1=200(y1), r2=233(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 200
LDI r2, 233
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
