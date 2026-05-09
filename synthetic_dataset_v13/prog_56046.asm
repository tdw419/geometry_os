; DESCRIPTION: Places a cyan circle of radius 78 at center (301, 134).
; PLAN: r0=301(x), r1=134(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 134
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
