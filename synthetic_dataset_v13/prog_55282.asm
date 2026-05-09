; DESCRIPTION: Places a orange circle of radius 28 at center (90, 190).
; PLAN: r0=90(x), r1=190(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 190
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
