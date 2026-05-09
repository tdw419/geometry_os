; DESCRIPTION: Composite: Places a yellow dot at position (49, 146) then Creates a cyan rectangular region at (93, 83) spanning 13 by 111 pixels.
; PLAN: r0=49(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=83(y), r7=13(width), r8=111(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 93
LDI r6, 83
LDI r7, 13
LDI r8, 111
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
