; DESCRIPTION: Places a orange line segment connecting (36, 153) to (143, 242).
; PLAN: r0=36(x1), r1=153(y1), r2=143(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 153
LDI r2, 143
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
