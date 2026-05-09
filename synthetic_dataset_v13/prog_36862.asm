; DESCRIPTION: Composite: Places a cyan dot at position (173, 98) then Creates a red rectangular region at (0, 195) spanning 59 by 31 pixels.
; PLAN: r0=173(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=195(y), r7=59(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 195
LDI r7, 59
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
