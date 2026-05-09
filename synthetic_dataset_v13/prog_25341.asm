; DESCRIPTION: Creates a cyan circular shape at (209, 79) with radius 60.
; PLAN: r0=209(x), r1=79(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 79
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
