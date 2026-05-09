; DESCRIPTION: Places a yellow line segment connecting (450, 73) to (22, 48).
; PLAN: r0=450(x1), r1=73(y1), r2=22(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 73
LDI r2, 22
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
