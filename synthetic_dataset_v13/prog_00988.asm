; DESCRIPTION: Renders a purple line between points (295, 171) and (303, 4).
; PLAN: r0=295(x1), r1=171(y1), r2=303(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 171
LDI r2, 303
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
