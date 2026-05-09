; DESCRIPTION: Draws a cyan circle centered at (85, 150) with radius 26.
; PLAN: r0=85(x), r1=150(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 150
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
