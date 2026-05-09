; DESCRIPTION: Composite: Places a red dot at position (128, 81) then Creates a purple circular shape at (243, 90) with radius 71.
; PLAN: r0=128(x), r1=81(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=90(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 128
LDI r1, 81
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 243
LDI r6, 90
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
