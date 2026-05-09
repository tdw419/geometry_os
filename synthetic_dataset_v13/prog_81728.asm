; DESCRIPTION: Draws a cyan circle centered at (439, 206) with radius 35.
; PLAN: r0=439(x), r1=206(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 206
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
