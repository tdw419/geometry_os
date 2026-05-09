; DESCRIPTION: Places a cyan line segment connecting (80, 106) to (138, 26).
; PLAN: r0=80(x1), r1=106(y1), r2=138(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 106
LDI r2, 138
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
