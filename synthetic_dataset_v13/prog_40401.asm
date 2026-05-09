; DESCRIPTION: Composite: Places a blue dot at position (275, 116) then Creates a white circular shape at (277, 168) with radius 64.
; PLAN: r0=275(x), r1=116(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=168(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 116
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 168
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
