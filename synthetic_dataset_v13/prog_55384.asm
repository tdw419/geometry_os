; DESCRIPTION: Draws a yellow line from (152, 113) to (285, 15).
; PLAN: r0=152(x1), r1=113(y1), r2=285(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 113
LDI r2, 285
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
