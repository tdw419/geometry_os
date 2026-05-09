; DESCRIPTION: Places a cyan line segment connecting (279, 53) to (43, 35).
; PLAN: r0=279(x1), r1=53(y1), r2=43(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 53
LDI r2, 43
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
