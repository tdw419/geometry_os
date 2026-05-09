; DESCRIPTION: Draws a cyan circle centered at (287, 65) with radius 20.
; PLAN: r0=287(x), r1=65(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 65
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
