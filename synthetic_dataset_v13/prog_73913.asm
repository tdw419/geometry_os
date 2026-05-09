; DESCRIPTION: Draws a cyan circle centered at (234, 159) with radius 50.
; PLAN: r0=234(x), r1=159(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 159
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
