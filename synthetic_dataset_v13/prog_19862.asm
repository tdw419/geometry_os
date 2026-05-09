; DESCRIPTION: Draws a yellow line from (301, 112) to (172, 94).
; PLAN: r0=301(x1), r1=112(y1), r2=172(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 112
LDI r2, 172
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
