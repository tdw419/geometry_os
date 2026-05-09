; DESCRIPTION: Draws a purple line from (372, 179) to (410, 212).
; PLAN: r0=372(x1), r1=179(y1), r2=410(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 179
LDI r2, 410
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
