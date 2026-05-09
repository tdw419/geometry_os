; DESCRIPTION: Draws a yellow line from (289, 232) to (21, 209).
; PLAN: r0=289(x1), r1=232(y1), r2=21(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 232
LDI r2, 21
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
