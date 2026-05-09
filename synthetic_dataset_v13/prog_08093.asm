; DESCRIPTION: Places a orange circle of radius 14 at center (482, 220).
; PLAN: r0=482(x), r1=220(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 220
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
