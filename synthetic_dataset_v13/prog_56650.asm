; DESCRIPTION: Renders a purple line between points (488, 107) and (279, 146).
; PLAN: r0=488(x1), r1=107(y1), r2=279(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 107
LDI r2, 279
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
