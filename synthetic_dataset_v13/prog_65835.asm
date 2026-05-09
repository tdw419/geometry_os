; DESCRIPTION: Places a black circle of radius 65 at center (90, 161).
; PLAN: r0=90(x), r1=161(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 161
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
