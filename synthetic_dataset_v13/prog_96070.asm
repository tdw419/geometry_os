; DESCRIPTION: Places a cyan line segment connecting (102, 154) to (134, 200).
; PLAN: r0=102(x1), r1=154(y1), r2=134(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 154
LDI r2, 134
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
