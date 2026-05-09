; DESCRIPTION: Draws a black line from (232, 129) to (225, 36).
; PLAN: r0=232(x1), r1=129(y1), r2=225(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 129
LDI r2, 225
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
