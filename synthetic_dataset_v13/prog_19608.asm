; DESCRIPTION: Draws a cyan circle centered at (188, 133) with radius 13.
; PLAN: r0=188(x), r1=133(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 133
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
