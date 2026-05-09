; DESCRIPTION: Draws a yellow line from (335, 73) to (222, 127).
; PLAN: r0=335(x1), r1=73(y1), r2=222(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 73
LDI r2, 222
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
