; DESCRIPTION: Draws a yellow line from (440, 34) to (78, 143).
; PLAN: r0=440(x1), r1=34(y1), r2=78(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 34
LDI r2, 78
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
