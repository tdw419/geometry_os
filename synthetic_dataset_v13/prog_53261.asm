; DESCRIPTION: Places a orange line segment connecting (38, 249) to (242, 165).
; PLAN: r0=38(x1), r1=249(y1), r2=242(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 249
LDI r2, 242
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
