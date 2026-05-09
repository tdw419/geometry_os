; DESCRIPTION: Places a orange circle of radius 67 at center (423, 95).
; PLAN: r0=423(x), r1=95(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 95
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
