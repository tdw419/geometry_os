; DESCRIPTION: Places a cyan line segment connecting (291, 121) to (190, 84).
; PLAN: r0=291(x1), r1=121(y1), r2=190(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 121
LDI r2, 190
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
