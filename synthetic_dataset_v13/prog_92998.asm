; DESCRIPTION: Renders a purple line between points (70, 28) and (143, 18).
; PLAN: r0=70(x1), r1=28(y1), r2=143(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 28
LDI r2, 143
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
