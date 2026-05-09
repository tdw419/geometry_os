; DESCRIPTION: Renders a purple line between points (372, 40) and (214, 10).
; PLAN: r0=372(x1), r1=40(y1), r2=214(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 40
LDI r2, 214
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
