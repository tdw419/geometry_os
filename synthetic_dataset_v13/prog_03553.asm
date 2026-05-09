; DESCRIPTION: Renders a purple line between points (446, 208) and (5, 253).
; PLAN: r0=446(x1), r1=208(y1), r2=5(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 208
LDI r2, 5
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
