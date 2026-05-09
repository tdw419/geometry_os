; DESCRIPTION: Places a cyan line segment connecting (105, 76) to (14, 237).
; PLAN: r0=105(x1), r1=76(y1), r2=14(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 76
LDI r2, 14
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
