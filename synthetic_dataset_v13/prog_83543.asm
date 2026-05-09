; DESCRIPTION: Draws a cyan circle centered at (302, 64) with radius 24.
; PLAN: r0=302(x), r1=64(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 64
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
