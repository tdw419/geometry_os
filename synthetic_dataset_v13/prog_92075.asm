; DESCRIPTION: Composite: Creates a blue circular shape at (443, 162) with radius 63 then Sets a single white pixel at (356, 243).
; PLAN: r0=443(x), r1=162(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=243(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 443
LDI r1, 162
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 243
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
