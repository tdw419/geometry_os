; DESCRIPTION: Draws a red line from (279, 251) to (222, 205).
; PLAN: r0=279(x1), r1=251(y1), r2=222(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 251
LDI r2, 222
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
