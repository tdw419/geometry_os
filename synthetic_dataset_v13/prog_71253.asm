; DESCRIPTION: Draws a cyan circle centered at (286, 47) with radius 32.
; PLAN: r0=286(x), r1=47(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 47
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
