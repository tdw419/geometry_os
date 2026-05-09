; DESCRIPTION: Places a cyan circle of radius 14 at center (389, 242).
; PLAN: r0=389(x), r1=242(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 242
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
