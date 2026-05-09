; DESCRIPTION: Draws a purple line from (308, 73) to (301, 103).
; PLAN: r0=308(x1), r1=73(y1), r2=301(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 73
LDI r2, 301
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
