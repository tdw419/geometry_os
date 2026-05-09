; DESCRIPTION: Draws a cyan circle centered at (419, 54) with radius 16.
; PLAN: r0=419(x), r1=54(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 54
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
