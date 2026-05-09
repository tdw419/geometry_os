; DESCRIPTION: Renders a purple line between points (298, 12) and (386, 62).
; PLAN: r0=298(x1), r1=12(y1), r2=386(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 12
LDI r2, 386
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
