; DESCRIPTION: Composite: Creates a red circular shape at (53, 208) with radius 29 then Sets a single cyan pixel at (20, 65).
; PLAN: r0=53(x), r1=208(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=65(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 208
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 65
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
