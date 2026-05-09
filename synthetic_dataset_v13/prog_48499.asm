; DESCRIPTION: Draws a cyan circle centered at (302, 144) with radius 38.
; PLAN: r0=302(x), r1=144(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 144
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
