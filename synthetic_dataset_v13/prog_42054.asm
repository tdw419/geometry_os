; DESCRIPTION: Renders a purple line between points (303, 70) and (171, 128).
; PLAN: r0=303(x1), r1=70(y1), r2=171(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 70
LDI r2, 171
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
