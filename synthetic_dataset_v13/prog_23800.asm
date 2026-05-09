; DESCRIPTION: Places a orange line segment connecting (242, 84) to (171, 89).
; PLAN: r0=242(x1), r1=84(y1), r2=171(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 84
LDI r2, 171
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
