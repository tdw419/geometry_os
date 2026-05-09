; DESCRIPTION: Draws a yellow line from (9, 144) to (382, 167).
; PLAN: r0=9(x1), r1=144(y1), r2=382(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 144
LDI r2, 382
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
