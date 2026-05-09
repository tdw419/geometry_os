; DESCRIPTION: Renders a green line between points (481, 38) and (476, 188).
; PLAN: r0=481(x1), r1=38(y1), r2=476(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 38
LDI r2, 476
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
