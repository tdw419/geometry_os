; DESCRIPTION: Places a cyan line segment connecting (23, 115) to (101, 74).
; PLAN: r0=23(x1), r1=115(y1), r2=101(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 115
LDI r2, 101
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
