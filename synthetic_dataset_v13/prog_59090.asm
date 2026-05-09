; DESCRIPTION: Draws a red line from (422, 20) to (98, 183).
; PLAN: r0=422(x1), r1=20(y1), r2=98(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 20
LDI r2, 98
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
