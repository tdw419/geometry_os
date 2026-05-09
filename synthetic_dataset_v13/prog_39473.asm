; DESCRIPTION: Renders a yellow line between points (182, 11) and (349, 209).
; PLAN: r0=182(x1), r1=11(y1), r2=349(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 11
LDI r2, 349
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
