; DESCRIPTION: Renders a purple line between points (499, 18) and (48, 250).
; PLAN: r0=499(x1), r1=18(y1), r2=48(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 18
LDI r2, 48
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
