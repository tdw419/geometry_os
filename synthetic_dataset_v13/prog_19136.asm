; DESCRIPTION: Renders a purple line between points (330, 95) and (179, 242).
; PLAN: r0=330(x1), r1=95(y1), r2=179(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 95
LDI r2, 179
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
