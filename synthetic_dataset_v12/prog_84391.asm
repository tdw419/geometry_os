; DESCRIPTION: Places a orange line segment connecting (340, 41) to (290, 242).
; PLAN: r0=340(x1), r1=41(y1), r2=290(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 41
LDI r2, 290
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
