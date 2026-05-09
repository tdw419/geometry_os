; DESCRIPTION: Creates a cyan circular shape at (84, 214) with radius 25.
; PLAN: r0=84(x), r1=214(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 214
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
