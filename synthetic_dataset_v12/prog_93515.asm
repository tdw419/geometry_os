; DESCRIPTION: Draws a red line from (422, 98) to (195, 196).
; PLAN: r0=422(x1), r1=98(y1), r2=195(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 98
LDI r2, 195
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
