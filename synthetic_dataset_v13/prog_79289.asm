; DESCRIPTION: Draws a cyan circle centered at (266, 182) with radius 48.
; PLAN: r0=266(x), r1=182(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 182
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
