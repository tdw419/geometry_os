; DESCRIPTION: Renders a purple line between points (446, 98) and (69, 237).
; PLAN: r0=446(x1), r1=98(y1), r2=69(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 98
LDI r2, 69
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
