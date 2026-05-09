; DESCRIPTION: Composite: Places a cyan dot at position (374, 79) then Creates a black rectangular region at (299, 187) spanning 58 by 62 pixels.
; PLAN: r0=374(x), r1=79(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=187(y), r7=58(width), r8=62(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 79
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 187
LDI r7, 58
LDI r8, 62
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
