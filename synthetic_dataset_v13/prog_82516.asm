; DESCRIPTION: Draws a yellow line from (483, 64) to (186, 40).
; PLAN: r0=483(x1), r1=64(y1), r2=186(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 64
LDI r2, 186
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
