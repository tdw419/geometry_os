; DESCRIPTION: Places a cyan line segment connecting (465, 160) to (93, 22).
; PLAN: r0=465(x1), r1=160(y1), r2=93(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 160
LDI r2, 93
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
