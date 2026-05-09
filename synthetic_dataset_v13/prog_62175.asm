; DESCRIPTION: Draws a yellow line from (205, 153) to (260, 7).
; PLAN: r0=205(x1), r1=153(y1), r2=260(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 153
LDI r2, 260
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
