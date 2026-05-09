; DESCRIPTION: Draws a white line from (285, 1) to (400, 172).
; PLAN: r0=285(x1), r1=1(y1), r2=400(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 1
LDI r2, 400
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
