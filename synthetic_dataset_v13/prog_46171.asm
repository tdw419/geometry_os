; DESCRIPTION: Composite: Creates a magenta rectangular region at (204, 124) spanning 76 by 77 pixels then Places a cyan dot at position (434, 147).
; PLAN: r0=204(x), r1=124(y), r2=76(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 204
LDI r1, 124
LDI r2, 76
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
