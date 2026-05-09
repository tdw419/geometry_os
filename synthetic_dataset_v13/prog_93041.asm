; DESCRIPTION: Draws a purple line from (342, 129) to (283, 167).
; PLAN: r0=342(x1), r1=129(y1), r2=283(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 129
LDI r2, 283
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
