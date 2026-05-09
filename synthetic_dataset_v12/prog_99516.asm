; DESCRIPTION: Draws a cyan circle centered at (346, 147) with radius 42.
; PLAN: r0=346(x), r1=147(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 147
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
