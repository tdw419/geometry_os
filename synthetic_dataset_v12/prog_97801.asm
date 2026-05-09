; DESCRIPTION: Draws a cyan circle centered at (350, 178) with radius 69.
; PLAN: r0=350(x), r1=178(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 178
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
