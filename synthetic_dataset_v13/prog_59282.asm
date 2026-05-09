; DESCRIPTION: Places a cyan line segment connecting (7, 138) to (179, 109).
; PLAN: r0=7(x1), r1=138(y1), r2=179(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 138
LDI r2, 179
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
