; DESCRIPTION: Draws a yellow line from (29, 241) to (39, 249).
; PLAN: r0=29(x1), r1=241(y1), r2=39(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 241
LDI r2, 39
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
