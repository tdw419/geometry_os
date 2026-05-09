; DESCRIPTION: Places a cyan line segment connecting (395, 76) to (283, 216).
; PLAN: r0=395(x1), r1=76(y1), r2=283(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 76
LDI r2, 283
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
