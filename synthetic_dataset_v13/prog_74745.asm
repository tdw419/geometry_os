; DESCRIPTION: Places a orange line segment connecting (16, 103) to (327, 147).
; PLAN: r0=16(x1), r1=103(y1), r2=327(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 103
LDI r2, 327
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
