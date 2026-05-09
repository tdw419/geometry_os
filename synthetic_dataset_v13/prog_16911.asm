; DESCRIPTION: Draws a cyan circle centered at (45, 216) with radius 25.
; PLAN: r0=45(x), r1=216(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 216
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
