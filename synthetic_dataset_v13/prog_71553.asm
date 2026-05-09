; DESCRIPTION: Draws a cyan circle centered at (252, 164) with radius 59.
; PLAN: r0=252(x), r1=164(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 164
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
