; DESCRIPTION: Draws a yellow line from (108, 207) to (112, 98).
; PLAN: r0=108(x1), r1=207(y1), r2=112(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 207
LDI r2, 112
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
