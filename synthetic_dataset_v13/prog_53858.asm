; DESCRIPTION: Places a orange line segment connecting (370, 145) to (354, 242).
; PLAN: r0=370(x1), r1=145(y1), r2=354(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 145
LDI r2, 354
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
