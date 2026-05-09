; DESCRIPTION: Places a green line segment connecting (353, 3) to (481, 121).
; PLAN: r0=353(x1), r1=3(y1), r2=481(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 3
LDI r2, 481
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
