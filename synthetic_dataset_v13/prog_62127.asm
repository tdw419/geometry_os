; DESCRIPTION: Places a cyan line segment connecting (148, 7) to (462, 158).
; PLAN: r0=148(x1), r1=7(y1), r2=462(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 7
LDI r2, 462
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
