; DESCRIPTION: Renders a purple line between points (65, 141) and (298, 10).
; PLAN: r0=65(x1), r1=141(y1), r2=298(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 141
LDI r2, 298
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
