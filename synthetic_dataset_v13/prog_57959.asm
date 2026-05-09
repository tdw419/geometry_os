; DESCRIPTION: Draws a cyan circle centered at (176, 158) with radius 66.
; PLAN: r0=176(x), r1=158(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 158
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
