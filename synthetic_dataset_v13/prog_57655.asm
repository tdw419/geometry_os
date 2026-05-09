; DESCRIPTION: Renders a blue line between points (252, 242) and (362, 179).
; PLAN: r0=252(x1), r1=242(y1), r2=362(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 242
LDI r2, 362
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
