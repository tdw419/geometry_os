; DESCRIPTION: Renders a purple line between points (395, 96) and (410, 52).
; PLAN: r0=395(x1), r1=96(y1), r2=410(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 96
LDI r2, 410
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
