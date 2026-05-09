; DESCRIPTION: Places a cyan line segment connecting (67, 117) to (98, 105).
; PLAN: r0=67(x1), r1=117(y1), r2=98(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 117
LDI r2, 98
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
