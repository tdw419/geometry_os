; DESCRIPTION: Places a cyan line segment connecting (58, 1) to (136, 73).
; PLAN: r0=58(x1), r1=1(y1), r2=136(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 1
LDI r2, 136
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
