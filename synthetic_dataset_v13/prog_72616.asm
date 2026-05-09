; DESCRIPTION: Renders a yellow line between points (481, 53) and (207, 237).
; PLAN: r0=481(x1), r1=53(y1), r2=207(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 53
LDI r2, 207
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
