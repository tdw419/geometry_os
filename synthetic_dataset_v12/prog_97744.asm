; DESCRIPTION: Composite: Creates a yellow circular shape at (185, 96) with radius 64 then Sets a single cyan pixel at (262, 107).
; PLAN: r0=185(x), r1=96(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x), r6=107(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 96
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 107
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
