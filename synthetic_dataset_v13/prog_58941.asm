; DESCRIPTION: Places a cyan line segment connecting (421, 88) to (55, 28).
; PLAN: r0=421(x1), r1=88(y1), r2=55(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 88
LDI r2, 55
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
