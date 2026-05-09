; DESCRIPTION: Draws a black circle centered at (295, 216) with radius 11.
; PLAN: r0=295(x), r1=216(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 216
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
