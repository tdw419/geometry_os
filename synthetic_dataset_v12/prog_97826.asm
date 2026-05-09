; DESCRIPTION: Places a cyan circle of radius 37 at center (108, 65).
; PLAN: r0=108(x), r1=65(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 65
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
