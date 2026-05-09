; DESCRIPTION: Draws a cyan circle centered at (87, 206) with radius 15.
; PLAN: r0=87(x), r1=206(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 206
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
