; DESCRIPTION: Draws a cyan circle centered at (74, 206) with radius 45.
; PLAN: r0=74(x), r1=206(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 206
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
