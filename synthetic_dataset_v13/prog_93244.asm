; DESCRIPTION: Places a cyan line segment connecting (26, 158) to (193, 138).
; PLAN: r0=26(x1), r1=158(y1), r2=193(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 158
LDI r2, 193
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
