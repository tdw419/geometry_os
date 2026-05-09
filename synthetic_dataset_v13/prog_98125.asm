; DESCRIPTION: Draws a yellow line from (36, 161) to (269, 98).
; PLAN: r0=36(x1), r1=161(y1), r2=269(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 161
LDI r2, 269
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
