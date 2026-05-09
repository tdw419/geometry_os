; DESCRIPTION: Draws a purple line from (193, 114) to (293, 28).
; PLAN: r0=193(x1), r1=114(y1), r2=293(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 114
LDI r2, 293
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
