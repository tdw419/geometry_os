; DESCRIPTION: Composite: Places a green dot at position (417, 59) then Creates a green circular shape at (249, 193) with radius 39.
; PLAN: r0=417(x), r1=59(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=193(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 59
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 249
LDI r6, 193
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
