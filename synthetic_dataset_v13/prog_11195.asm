; DESCRIPTION: Draws a yellow line from (260, 0) to (186, 149).
; PLAN: r0=260(x1), r1=0(y1), r2=186(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 0
LDI r2, 186
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
