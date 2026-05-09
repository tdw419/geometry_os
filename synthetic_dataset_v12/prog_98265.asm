; DESCRIPTION: Draws a cyan circle centered at (128, 70) with radius 35.
; PLAN: r0=128(x), r1=70(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 70
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
