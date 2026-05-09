; DESCRIPTION: Draws a cyan circle centered at (316, 164) with radius 42.
; PLAN: r0=316(x), r1=164(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 164
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
