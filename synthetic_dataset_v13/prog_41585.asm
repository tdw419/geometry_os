; DESCRIPTION: Places a cyan line segment connecting (409, 18) to (28, 118).
; PLAN: r0=409(x1), r1=18(y1), r2=28(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 18
LDI r2, 28
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
