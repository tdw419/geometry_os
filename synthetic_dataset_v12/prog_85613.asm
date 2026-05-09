; DESCRIPTION: Places a cyan circle of radius 76 at center (353, 143).
; PLAN: r0=353(x), r1=143(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 143
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
