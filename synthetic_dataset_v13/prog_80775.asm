; DESCRIPTION: Draws a cyan circle centered at (316, 180) with radius 75.
; PLAN: r0=316(x), r1=180(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 180
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
