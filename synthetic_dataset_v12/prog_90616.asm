; DESCRIPTION: Draws a black circle centered at (352, 228) with radius 10.
; PLAN: r0=352(x), r1=228(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 228
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
