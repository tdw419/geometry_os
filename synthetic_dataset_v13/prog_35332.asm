; DESCRIPTION: Draws a yellow line from (145, 242) to (301, 66).
; PLAN: r0=145(x1), r1=242(y1), r2=301(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 242
LDI r2, 301
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
