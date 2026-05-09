; DESCRIPTION: Draws a yellow line from (46, 12) to (142, 74).
; PLAN: r0=46(x1), r1=12(y1), r2=142(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 12
LDI r2, 142
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
