; DESCRIPTION: Draws a red line from (422, 14) to (263, 60).
; PLAN: r0=422(x1), r1=14(y1), r2=263(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 14
LDI r2, 263
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
