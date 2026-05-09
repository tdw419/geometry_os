; DESCRIPTION: Renders a purple line between points (178, 170) and (340, 253).
; PLAN: r0=178(x1), r1=170(y1), r2=340(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 170
LDI r2, 340
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
