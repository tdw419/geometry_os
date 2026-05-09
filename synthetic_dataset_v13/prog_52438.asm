; DESCRIPTION: Places a cyan line segment connecting (196, 216) to (199, 53).
; PLAN: r0=196(x1), r1=216(y1), r2=199(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 216
LDI r2, 199
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
