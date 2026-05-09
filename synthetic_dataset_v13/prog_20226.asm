; DESCRIPTION: Creates a cyan circular shape at (408, 64) with radius 56.
; PLAN: r0=408(x), r1=64(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 64
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
