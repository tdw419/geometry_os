; DESCRIPTION: Draws a cyan line from (31, 103) to (422, 185).
; PLAN: r0=31(x1), r1=103(y1), r2=422(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 103
LDI r2, 422
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
