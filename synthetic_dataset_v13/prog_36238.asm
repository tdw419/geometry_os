; DESCRIPTION: Draws a cyan circle centered at (335, 50) with radius 46.
; PLAN: r0=335(x), r1=50(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 50
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
