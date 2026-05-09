; DESCRIPTION: Draws a cyan circle centered at (136, 228) with radius 11.
; PLAN: r0=136(x), r1=228(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 228
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
