; DESCRIPTION: Renders a purple line between points (214, 44) and (13, 208).
; PLAN: r0=214(x1), r1=44(y1), r2=13(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 44
LDI r2, 13
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
