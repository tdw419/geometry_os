; DESCRIPTION: Renders a purple line between points (446, 79) and (362, 48).
; PLAN: r0=446(x1), r1=79(y1), r2=362(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 79
LDI r2, 362
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
