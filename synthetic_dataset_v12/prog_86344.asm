; DESCRIPTION: Draws a purple line from (249, 10) to (380, 29).
; PLAN: r0=249(x1), r1=10(y1), r2=380(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 10
LDI r2, 380
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
