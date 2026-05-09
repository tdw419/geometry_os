; DESCRIPTION: Places a cyan line segment connecting (216, 0) to (511, 216).
; PLAN: r0=216(x1), r1=0(y1), r2=511(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 0
LDI r2, 511
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
