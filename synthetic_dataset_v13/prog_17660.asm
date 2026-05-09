; DESCRIPTION: Composite: Places a orange dot at position (7, 171) then Places a green circle of radius 62 at center (356, 133).
; PLAN: r0=7(x), r1=171(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=133(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 171
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 356
LDI r6, 133
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
