; DESCRIPTION: Draws a orange line from (254, 196) to (422, 195).
; PLAN: r0=254(x1), r1=196(y1), r2=422(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 196
LDI r2, 422
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
