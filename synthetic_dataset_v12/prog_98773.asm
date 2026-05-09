; DESCRIPTION: Places a cyan line segment connecting (317, 158) to (68, 92).
; PLAN: r0=317(x1), r1=158(y1), r2=68(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 158
LDI r2, 68
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
