; DESCRIPTION: Draws a cyan circle centered at (178, 141) with radius 49.
; PLAN: r0=178(x), r1=141(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 141
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
