; DESCRIPTION: Draws a yellow line from (176, 162) to (218, 253).
; PLAN: r0=176(x1), r1=162(y1), r2=218(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 162
LDI r2, 218
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
