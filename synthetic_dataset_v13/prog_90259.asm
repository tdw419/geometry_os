; DESCRIPTION: Places a cyan circle of radius 46 at center (291, 65).
; PLAN: r0=291(x), r1=65(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 65
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
