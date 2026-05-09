; DESCRIPTION: Draws a green line from (15, 226) to (422, 68).
; PLAN: r0=15(x1), r1=226(y1), r2=422(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 226
LDI r2, 422
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
