; DESCRIPTION: Places a cyan circle of radius 47 at center (273, 108).
; PLAN: r0=273(x), r1=108(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 108
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
