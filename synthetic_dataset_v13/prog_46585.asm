; DESCRIPTION: Draws a cyan circle centered at (473, 182) with radius 13.
; PLAN: r0=473(x), r1=182(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 182
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
