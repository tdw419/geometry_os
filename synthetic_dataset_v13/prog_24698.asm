; DESCRIPTION: Draws a black line from (208, 243) to (232, 232).
; PLAN: r0=208(x1), r1=243(y1), r2=232(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 243
LDI r2, 232
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
