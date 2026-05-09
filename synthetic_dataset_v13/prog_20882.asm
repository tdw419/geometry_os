; DESCRIPTION: Places a cyan circle of radius 25 at center (377, 65).
; PLAN: r0=377(x), r1=65(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 65
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
