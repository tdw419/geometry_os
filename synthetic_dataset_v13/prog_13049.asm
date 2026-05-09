; DESCRIPTION: Renders a green line between points (332, 22) and (481, 127).
; PLAN: r0=332(x1), r1=22(y1), r2=481(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 22
LDI r2, 481
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
