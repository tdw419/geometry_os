; DESCRIPTION: Draws a yellow line from (458, 210) to (236, 100).
; PLAN: r0=458(x1), r1=210(y1), r2=236(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 210
LDI r2, 236
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
