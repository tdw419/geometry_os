; DESCRIPTION: Composite: Places a cyan dot at position (443, 178) then Creates a magenta circular shape at (299, 69) with radius 18.
; PLAN: r0=443(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=69(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 69
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
