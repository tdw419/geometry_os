; DESCRIPTION: Draws a yellow line from (9, 47) to (208, 74).
; PLAN: r0=9(x1), r1=47(y1), r2=208(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 47
LDI r2, 208
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
