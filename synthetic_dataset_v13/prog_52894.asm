; DESCRIPTION: Composite: Places a cyan dot at position (178, 38) then Creates a yellow rectangular region at (327, 73) spanning 99 by 76 pixels.
; PLAN: r0=178(x), r1=38(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=73(y), r7=99(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 38
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 73
LDI r7, 99
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
