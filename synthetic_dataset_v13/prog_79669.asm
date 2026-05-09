; DESCRIPTION: Draws a cyan circle centered at (104, 67) with radius 17.
; PLAN: r0=104(x), r1=67(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 67
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
