; DESCRIPTION: Draws a yellow line from (233, 47) to (273, 69).
; PLAN: r0=233(x1), r1=47(y1), r2=273(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 47
LDI r2, 273
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
