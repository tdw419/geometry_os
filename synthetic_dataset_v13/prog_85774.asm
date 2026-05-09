; DESCRIPTION: Composite: Sets a single yellow pixel at (511, 125) then Creates a black rectangular region at (409, 131) spanning 50 by 47 pixels.
; PLAN: r0=511(x), r1=125(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=131(y), r7=50(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 125
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 409
LDI r6, 131
LDI r7, 50
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
