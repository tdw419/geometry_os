; DESCRIPTION: Draws a cyan circle centered at (335, 79) with radius 57.
; PLAN: r0=335(x), r1=79(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 79
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
