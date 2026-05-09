; DESCRIPTION: Places a yellow line segment connecting (458, 27) to (72, 109).
; PLAN: r0=458(x1), r1=27(y1), r2=72(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 27
LDI r2, 72
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
