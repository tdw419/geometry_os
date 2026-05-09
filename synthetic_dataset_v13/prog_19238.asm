; DESCRIPTION: Places a cyan line segment connecting (357, 32) to (46, 216).
; PLAN: r0=357(x1), r1=32(y1), r2=46(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 32
LDI r2, 46
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
