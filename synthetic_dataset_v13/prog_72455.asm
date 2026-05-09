; DESCRIPTION: Composite: Places a cyan dot at position (477, 2) then Creates a yellow rectangular region at (282, 68) spanning 80 by 33 pixels.
; PLAN: r0=477(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=68(y), r7=80(width), r8=33(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 68
LDI r7, 80
LDI r8, 33
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
