; DESCRIPTION: Draws a yellow line from (223, 215) to (369, 170).
; PLAN: r0=223(x1), r1=215(y1), r2=369(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 215
LDI r2, 369
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
