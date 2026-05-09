; DESCRIPTION: Draws a red line from (349, 1) to (279, 46).
; PLAN: r0=349(x1), r1=1(y1), r2=279(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 1
LDI r2, 279
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
