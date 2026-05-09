; DESCRIPTION: Places a orange line segment connecting (3, 244) to (160, 242).
; PLAN: r0=3(x1), r1=244(y1), r2=160(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 244
LDI r2, 160
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
