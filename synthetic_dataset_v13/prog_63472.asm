; DESCRIPTION: Places a orange circle of radius 43 at center (256, 94).
; PLAN: r0=256(x), r1=94(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 94
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
