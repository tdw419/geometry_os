; DESCRIPTION: Renders a purple line between points (498, 46) and (333, 153).
; PLAN: r0=498(x1), r1=46(y1), r2=333(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 46
LDI r2, 333
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
