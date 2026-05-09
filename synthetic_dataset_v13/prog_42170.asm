; DESCRIPTION: Draws a cyan circle centered at (224, 55) with radius 29.
; PLAN: r0=224(x), r1=55(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 55
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
