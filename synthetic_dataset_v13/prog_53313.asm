; DESCRIPTION: Places a orange circle of radius 11 at center (482, 69).
; PLAN: r0=482(x), r1=69(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 69
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
