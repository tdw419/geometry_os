; DESCRIPTION: Renders a yellow line between points (499, 134) and (484, 214).
; PLAN: r0=499(x1), r1=134(y1), r2=484(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 134
LDI r2, 484
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
