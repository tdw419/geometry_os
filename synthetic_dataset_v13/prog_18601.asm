; DESCRIPTION: Draws a yellow line from (223, 114) to (152, 229).
; PLAN: r0=223(x1), r1=114(y1), r2=152(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 114
LDI r2, 152
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
