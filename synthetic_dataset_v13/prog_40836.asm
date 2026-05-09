; DESCRIPTION: Places a orange circle of radius 39 at center (255, 161).
; PLAN: r0=255(x), r1=161(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 161
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
