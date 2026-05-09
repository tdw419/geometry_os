; DESCRIPTION: Draws a cyan circle centered at (228, 172) with radius 50.
; PLAN: r0=228(x), r1=172(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 172
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
