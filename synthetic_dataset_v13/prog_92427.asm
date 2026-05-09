; DESCRIPTION: Draws a cyan circle centered at (90, 86) with radius 58.
; PLAN: r0=90(x), r1=86(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 86
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
