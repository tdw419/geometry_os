; DESCRIPTION: Composite: Places a white dot at position (28, 158) then Creates a magenta circular shape at (327, 161) with radius 27.
; PLAN: r0=28(x), r1=158(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=161(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 158
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 161
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
