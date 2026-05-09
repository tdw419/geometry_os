; DESCRIPTION: Composite: Creates a white circular shape at (168, 28) with radius 24 then Sets a single black pixel at (168, 208).
; PLAN: r0=168(x), r1=28(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 168
LDI r1, 28
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
HALT
