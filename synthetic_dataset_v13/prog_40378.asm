; DESCRIPTION: Composite: Sets a single green pixel at (420, 119) then Creates a orange rectangular region at (108, 109) spanning 64 by 100 pixels.
; PLAN: r0=420(x), r1=119(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=109(y), r7=64(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 119
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 109
LDI r7, 64
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
