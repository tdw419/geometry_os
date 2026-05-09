; DESCRIPTION: Composite: Sets a single cyan pixel at (292, 221) then Creates a yellow circular shape at (151, 128) with radius 22.
; PLAN: r0=292(x), r1=221(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=128(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 292
LDI r1, 221
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 151
LDI r6, 128
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
