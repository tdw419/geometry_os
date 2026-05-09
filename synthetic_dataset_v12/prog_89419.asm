; DESCRIPTION: Draws a yellow line from (192, 33) to (395, 186).
; PLAN: r0=192(x1), r1=33(y1), r2=395(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 33
LDI r2, 395
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
