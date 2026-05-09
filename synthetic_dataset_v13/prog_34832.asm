; DESCRIPTION: Draws a cyan circle centered at (65, 181) with radius 29.
; PLAN: r0=65(x), r1=181(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 181
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
