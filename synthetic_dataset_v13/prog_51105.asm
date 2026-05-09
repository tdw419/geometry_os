; DESCRIPTION: Draws a white line from (78, 141) to (422, 182).
; PLAN: r0=78(x1), r1=141(y1), r2=422(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 141
LDI r2, 422
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
