; DESCRIPTION: Composite: Places a yellow dot at position (421, 39) then Creates a orange circular shape at (34, 70) with radius 28.
; PLAN: r0=421(x), r1=39(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=34(x), r6=70(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 39
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 34
LDI r6, 70
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
