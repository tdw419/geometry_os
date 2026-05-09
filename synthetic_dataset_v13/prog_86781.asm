; DESCRIPTION: Places a red line segment connecting (298, 116) to (458, 163).
; PLAN: r0=298(x1), r1=116(y1), r2=458(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 116
LDI r2, 458
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
