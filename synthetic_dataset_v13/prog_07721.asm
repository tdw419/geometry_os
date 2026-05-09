; DESCRIPTION: Draws a yellow line from (494, 25) to (186, 170).
; PLAN: r0=494(x1), r1=25(y1), r2=186(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 25
LDI r2, 186
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
