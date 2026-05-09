; DESCRIPTION: Places a cyan line segment connecting (395, 118) to (230, 76).
; PLAN: r0=395(x1), r1=118(y1), r2=230(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 118
LDI r2, 230
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
