; DESCRIPTION: Draws a cyan circle centered at (389, 134) with radius 67.
; PLAN: r0=389(x), r1=134(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 134
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
