; DESCRIPTION: Composite: Places a black dot at position (200, 33) then Creates a red rectangular region at (431, 12) spanning 68 by 76 pixels.
; PLAN: r0=200(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x), r6=12(y), r7=68(width), r8=76(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 12
LDI r7, 68
LDI r8, 76
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
