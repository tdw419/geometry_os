; DESCRIPTION: Draws a cyan circle centered at (413, 86) with radius 21.
; PLAN: r0=413(x), r1=86(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 86
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
