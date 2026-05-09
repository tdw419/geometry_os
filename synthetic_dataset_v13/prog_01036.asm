; DESCRIPTION: Draws a red line from (484, 252) to (40, 242).
; PLAN: r0=484(x1), r1=252(y1), r2=40(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 252
LDI r2, 40
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
