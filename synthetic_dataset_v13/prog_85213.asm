; DESCRIPTION: Places a red line segment connecting (242, 78) to (409, 87).
; PLAN: r0=242(x1), r1=78(y1), r2=409(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 78
LDI r2, 409
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
