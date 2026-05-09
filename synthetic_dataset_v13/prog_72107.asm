; DESCRIPTION: Places a purple line segment connecting (121, 182) to (393, 243).
; PLAN: r0=121(x1), r1=182(y1), r2=393(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 182
LDI r2, 393
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
