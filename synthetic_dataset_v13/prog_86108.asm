; DESCRIPTION: Composite: Sets a single cyan pixel at (476, 146) then Creates a yellow circular shape at (397, 118) with radius 36.
; PLAN: r0=476(x), r1=146(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=118(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 476
LDI r1, 146
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 118
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
