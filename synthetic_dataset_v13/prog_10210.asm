; DESCRIPTION: Places a cyan line segment connecting (43, 25) to (216, 74).
; PLAN: r0=43(x1), r1=25(y1), r2=216(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 25
LDI r2, 216
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
