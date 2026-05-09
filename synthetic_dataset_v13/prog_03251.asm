; DESCRIPTION: Draws a cyan circle centered at (366, 57) with radius 32.
; PLAN: r0=366(x), r1=57(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 57
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
