; DESCRIPTION: Composite: Places a magenta dot at position (262, 209) then Creates a white circular shape at (171, 193) with radius 57.
; PLAN: r0=262(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=193(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 171
LDI r6, 193
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
