; DESCRIPTION: Draws a cyan circle centered at (174, 178) with radius 75.
; PLAN: r0=174(x), r1=178(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 178
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
