; DESCRIPTION: Draws a yellow line from (239, 248) to (369, 229).
; PLAN: r0=239(x1), r1=248(y1), r2=369(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 248
LDI r2, 369
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
