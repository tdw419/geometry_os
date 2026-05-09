; DESCRIPTION: Draws a cyan circle centered at (144, 121) with radius 26.
; PLAN: r0=144(x), r1=121(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 121
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
