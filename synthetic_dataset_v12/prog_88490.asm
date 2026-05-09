; DESCRIPTION: Composite: Places a yellow dot at position (114, 7) then Creates a cyan rectangular region at (99, 15) spanning 87 by 37 pixels.
; PLAN: r0=114(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=15(y), r7=87(width), r8=37(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 99
LDI r6, 15
LDI r7, 87
LDI r8, 37
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
