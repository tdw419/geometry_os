; DESCRIPTION: Renders a yellow line between points (132, 207) and (152, 229).
; PLAN: r0=132(x1), r1=207(y1), r2=152(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 207
LDI r2, 152
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
