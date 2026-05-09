; DESCRIPTION: Creates a cyan circular shape at (237, 79) with radius 78.
; PLAN: r0=237(x), r1=79(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 79
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
