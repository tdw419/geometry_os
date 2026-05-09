; DESCRIPTION: Draws a yellow line from (392, 248) to (336, 225).
; PLAN: r0=392(x1), r1=248(y1), r2=336(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 248
LDI r2, 336
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
