; DESCRIPTION: Places a red line segment connecting (34, 10) to (462, 27).
; PLAN: r0=34(x1), r1=10(y1), r2=462(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 10
LDI r2, 462
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
