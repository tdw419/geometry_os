; DESCRIPTION: Places a red circle of radius 10 at center (38, 205).
; PLAN: r0=38(x), r1=205(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 205
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
