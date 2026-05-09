; DESCRIPTION: Renders a purple line between points (499, 10) and (39, 29).
; PLAN: r0=499(x1), r1=10(y1), r2=39(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 10
LDI r2, 39
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
