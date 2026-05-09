; DESCRIPTION: Composite: Creates a black circular shape at (243, 174) with radius 42 then Sets a single purple pixel at (204, 173).
; PLAN: r0=243(x), r1=174(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=173(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 243
LDI r1, 174
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 173
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
