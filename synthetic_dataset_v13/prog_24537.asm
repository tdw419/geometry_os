; DESCRIPTION: Places a cyan line segment connecting (12, 14) to (462, 49).
; PLAN: r0=12(x1), r1=14(y1), r2=462(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 14
LDI r2, 462
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
