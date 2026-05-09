; DESCRIPTION: Composite: Places a cyan dot at position (281, 39) then Creates a orange rectangular region at (379, 108) spanning 86 by 18 pixels.
; PLAN: r0=281(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=108(y), r7=86(width), r8=18(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 108
LDI r7, 86
LDI r8, 18
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
