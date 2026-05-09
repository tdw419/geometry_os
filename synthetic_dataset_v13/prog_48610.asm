; DESCRIPTION: Draws a black circle centered at (281, 87) with radius 70.
; PLAN: r0=281(x), r1=87(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 87
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
