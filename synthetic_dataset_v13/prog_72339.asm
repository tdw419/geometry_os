; DESCRIPTION: Places a red line segment connecting (39, 245) to (265, 89).
; PLAN: r0=39(x1), r1=245(y1), r2=265(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 245
LDI r2, 265
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
