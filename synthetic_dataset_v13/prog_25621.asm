; DESCRIPTION: Draws a cyan circle centered at (392, 183) with radius 49.
; PLAN: r0=392(x), r1=183(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 183
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
