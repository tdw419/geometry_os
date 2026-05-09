; DESCRIPTION: Places a cyan line segment connecting (449, 110) to (410, 80).
; PLAN: r0=449(x1), r1=110(y1), r2=410(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 110
LDI r2, 410
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
