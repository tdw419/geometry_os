; DESCRIPTION: Renders a purple line between points (410, 72) and (436, 107).
; PLAN: r0=410(x1), r1=72(y1), r2=436(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 72
LDI r2, 436
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
