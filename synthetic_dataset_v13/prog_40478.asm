; DESCRIPTION: Draws a yellow line from (285, 208) to (382, 193).
; PLAN: r0=285(x1), r1=208(y1), r2=382(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 208
LDI r2, 382
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
