; DESCRIPTION: Draws a cyan circle centered at (285, 154) with radius 75.
; PLAN: r0=285(x), r1=154(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 154
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
