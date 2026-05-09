; DESCRIPTION: Draws a cyan circle centered at (332, 73) with radius 67.
; PLAN: r0=332(x), r1=73(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 73
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
