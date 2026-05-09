; DESCRIPTION: Draws a cyan circle centered at (137, 146) with radius 48.
; PLAN: r0=137(x), r1=146(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 146
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
