; DESCRIPTION: Draws a cyan circle centered at (305, 182) with radius 18.
; PLAN: r0=305(x), r1=182(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 182
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
