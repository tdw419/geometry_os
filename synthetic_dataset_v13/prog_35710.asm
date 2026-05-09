; DESCRIPTION: Creates a cyan circular shape at (412, 70) with radius 24.
; PLAN: r0=412(x), r1=70(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 70
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
