; DESCRIPTION: Draws a yellow line from (185, 129) to (466, 214).
; PLAN: r0=185(x1), r1=129(y1), r2=466(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 129
LDI r2, 466
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
