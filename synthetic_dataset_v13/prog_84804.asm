; DESCRIPTION: Draws a red line from (422, 238) to (397, 10).
; PLAN: r0=422(x1), r1=238(y1), r2=397(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 238
LDI r2, 397
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
