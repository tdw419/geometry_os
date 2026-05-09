; DESCRIPTION: Places a red line segment connecting (76, 190) to (380, 87).
; PLAN: r0=76(x1), r1=190(y1), r2=380(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 190
LDI r2, 380
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
