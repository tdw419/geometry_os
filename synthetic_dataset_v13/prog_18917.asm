; DESCRIPTION: Places a cyan line segment connecting (3, 125) to (291, 216).
; PLAN: r0=3(x1), r1=125(y1), r2=291(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 125
LDI r2, 291
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
