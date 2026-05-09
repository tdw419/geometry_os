; DESCRIPTION: Draws a red line from (72, 19) to (279, 153).
; PLAN: r0=72(x1), r1=19(y1), r2=279(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 19
LDI r2, 279
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
