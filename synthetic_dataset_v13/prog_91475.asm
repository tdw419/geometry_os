; DESCRIPTION: Draws a cyan circle centered at (201, 197) with radius 39.
; PLAN: r0=201(x), r1=197(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 197
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
