; DESCRIPTION: Draws a purple line from (354, 82) to (13, 246).
; PLAN: r0=354(x1), r1=82(y1), r2=13(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 82
LDI r2, 13
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
