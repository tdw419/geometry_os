; DESCRIPTION: Places a cyan circle of radius 43 at center (321, 200).
; PLAN: r0=321(x), r1=200(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 200
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
