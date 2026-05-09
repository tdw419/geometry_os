; DESCRIPTION: Creates a cyan circular shape at (22, 178) with radius 16.
; PLAN: r0=22(x), r1=178(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 178
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
