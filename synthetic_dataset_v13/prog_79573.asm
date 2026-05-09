; DESCRIPTION: Draws a cyan circle centered at (188, 116) with radius 56.
; PLAN: r0=188(x), r1=116(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 116
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
