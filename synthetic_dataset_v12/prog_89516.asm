; DESCRIPTION: Renders a yellow line between points (261, 122) and (410, 0).
; PLAN: r0=261(x1), r1=122(y1), r2=410(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 122
LDI r2, 410
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
