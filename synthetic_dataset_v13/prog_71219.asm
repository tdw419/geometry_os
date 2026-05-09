; DESCRIPTION: Draws a purple line from (393, 246) to (61, 83).
; PLAN: r0=393(x1), r1=246(y1), r2=61(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 246
LDI r2, 61
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
