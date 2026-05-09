; DESCRIPTION: Places a orange circle of radius 45 at center (387, 139).
; PLAN: r0=387(x), r1=139(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 139
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
