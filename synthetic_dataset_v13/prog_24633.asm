; DESCRIPTION: Draws a cyan circle centered at (88, 79) with radius 67.
; PLAN: r0=88(x), r1=79(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 79
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
