; DESCRIPTION: Draws a cyan circle centered at (271, 115) with radius 64.
; PLAN: r0=271(x), r1=115(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 115
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
