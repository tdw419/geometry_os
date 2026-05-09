; DESCRIPTION: Draws a cyan circle centered at (304, 99) with radius 60.
; PLAN: r0=304(x), r1=99(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 99
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
