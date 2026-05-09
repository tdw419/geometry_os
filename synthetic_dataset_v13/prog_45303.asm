; DESCRIPTION: Draws a cyan circle centered at (136, 176) with radius 59.
; PLAN: r0=136(x), r1=176(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 176
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
