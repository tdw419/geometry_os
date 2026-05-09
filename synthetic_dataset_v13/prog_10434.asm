; DESCRIPTION: Places a cyan circle of radius 65 at center (301, 92).
; PLAN: r0=301(x), r1=92(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 92
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
