; DESCRIPTION: Draws a cyan circle centered at (336, 112) with radius 42.
; PLAN: r0=336(x), r1=112(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 112
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
