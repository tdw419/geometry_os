; DESCRIPTION: Draws a cyan circle centered at (45, 209) with radius 43.
; PLAN: r0=45(x), r1=209(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 209
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
