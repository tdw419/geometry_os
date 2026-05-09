; DESCRIPTION: Draws a cyan circle centered at (224, 149) with radius 31.
; PLAN: r0=224(x), r1=149(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 149
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
