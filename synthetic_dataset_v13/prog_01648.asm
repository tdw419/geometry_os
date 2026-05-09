; DESCRIPTION: Draws a cyan circle centered at (225, 164) with radius 22.
; PLAN: r0=225(x), r1=164(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 164
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
