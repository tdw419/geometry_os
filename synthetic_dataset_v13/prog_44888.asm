; DESCRIPTION: Draws a purple line from (487, 31) to (246, 7).
; PLAN: r0=487(x1), r1=31(y1), r2=246(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 31
LDI r2, 246
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
