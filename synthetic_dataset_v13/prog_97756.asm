; DESCRIPTION: Draws a cyan circle centered at (233, 127) with radius 47.
; PLAN: r0=233(x), r1=127(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 127
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
