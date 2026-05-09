; DESCRIPTION: Places a orange line segment connecting (502, 8) to (262, 102).
; PLAN: r0=502(x1), r1=8(y1), r2=262(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 8
LDI r2, 262
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
