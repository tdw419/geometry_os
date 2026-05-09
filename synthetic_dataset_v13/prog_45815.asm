; DESCRIPTION: Draws a yellow line from (180, 127) to (247, 34).
; PLAN: r0=180(x1), r1=127(y1), r2=247(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 127
LDI r2, 247
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
