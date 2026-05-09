; DESCRIPTION: Creates a cyan circular shape at (391, 113) with radius 45.
; PLAN: r0=391(x), r1=113(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 113
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
