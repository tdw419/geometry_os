; DESCRIPTION: Renders a purple line between points (284, 49) and (373, 14).
; PLAN: r0=284(x1), r1=49(y1), r2=373(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 49
LDI r2, 373
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
