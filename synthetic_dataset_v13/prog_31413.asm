; DESCRIPTION: Draws a white line from (288, 101) to (422, 198).
; PLAN: r0=288(x1), r1=101(y1), r2=422(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 101
LDI r2, 422
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
