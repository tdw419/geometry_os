; DESCRIPTION: Places a white line segment connecting (65, 190) to (374, 36).
; PLAN: r0=65(x1), r1=190(y1), r2=374(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 190
LDI r2, 374
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
