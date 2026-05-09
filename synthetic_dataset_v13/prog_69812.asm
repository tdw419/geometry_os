; DESCRIPTION: Places a orange line segment connecting (365, 74) to (40, 242).
; PLAN: r0=365(x1), r1=74(y1), r2=40(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 74
LDI r2, 40
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
