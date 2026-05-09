; DESCRIPTION: Places a red line segment connecting (202, 17) to (49, 117).
; PLAN: r0=202(x1), r1=17(y1), r2=49(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 17
LDI r2, 49
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
