; DESCRIPTION: Renders a orange line between points (325, 242) and (102, 189).
; PLAN: r0=325(x1), r1=242(y1), r2=102(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 242
LDI r2, 102
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
