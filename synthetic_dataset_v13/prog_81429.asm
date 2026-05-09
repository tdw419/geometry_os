; DESCRIPTION: Composite: Sets a single white pixel at (455, 62) then Creates a green circular shape at (416, 63) with radius 54.
; PLAN: r0=455(x), r1=62(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=63(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 455
LDI r1, 62
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 416
LDI r6, 63
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
