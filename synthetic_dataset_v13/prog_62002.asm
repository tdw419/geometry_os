; DESCRIPTION: Places a blue line segment connecting (481, 146) to (0, 24).
; PLAN: r0=481(x1), r1=146(y1), r2=0(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 146
LDI r2, 0
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
