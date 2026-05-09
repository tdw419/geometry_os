; DESCRIPTION: Places a orange line segment connecting (71, 32) to (287, 242).
; PLAN: r0=71(x1), r1=32(y1), r2=287(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 32
LDI r2, 287
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
