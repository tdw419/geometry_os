; DESCRIPTION: Draws a yellow line from (314, 209) to (466, 193).
; PLAN: r0=314(x1), r1=209(y1), r2=466(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 209
LDI r2, 466
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
