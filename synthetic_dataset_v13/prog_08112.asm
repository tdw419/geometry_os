; DESCRIPTION: Draws a cyan circle centered at (264, 182) with radius 15.
; PLAN: r0=264(x), r1=182(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 182
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
