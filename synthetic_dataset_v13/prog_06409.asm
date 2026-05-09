; DESCRIPTION: Places a orange line segment connecting (237, 211) to (17, 242).
; PLAN: r0=237(x1), r1=211(y1), r2=17(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 211
LDI r2, 17
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
