; DESCRIPTION: Draws a white line from (422, 146) to (78, 199).
; PLAN: r0=422(x1), r1=146(y1), r2=78(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 146
LDI r2, 78
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
