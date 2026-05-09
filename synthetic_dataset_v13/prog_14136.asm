; DESCRIPTION: Composite: Places a purple dot at position (318, 134) then Creates a orange circular shape at (420, 168) with radius 70.
; PLAN: r0=318(x), r1=134(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=168(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 134
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 168
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
