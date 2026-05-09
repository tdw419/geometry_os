; DESCRIPTION: Draws a cyan circle centered at (391, 149) with radius 32.
; PLAN: r0=391(x), r1=149(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 149
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
