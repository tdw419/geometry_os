; DESCRIPTION: Draws a cyan circle centered at (363, 207) with radius 48.
; PLAN: r0=363(x), r1=207(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 207
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
