; DESCRIPTION: Creates a cyan circular shape at (371, 135) with radius 79.
; PLAN: r0=371(x), r1=135(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 135
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
