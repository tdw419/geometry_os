; DESCRIPTION: Draws a cyan circle centered at (349, 151) with radius 20.
; PLAN: r0=349(x), r1=151(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 151
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
