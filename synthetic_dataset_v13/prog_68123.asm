; DESCRIPTION: Draws a yellow line from (177, 54) to (158, 152).
; PLAN: r0=177(x1), r1=54(y1), r2=158(x2), r3=152(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 54
LDI r2, 158
LDI r3, 152
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
