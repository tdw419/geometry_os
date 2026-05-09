; DESCRIPTION: Places a cyan circle of radius 24 at center (347, 159).
; PLAN: r0=347(x), r1=159(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 159
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
