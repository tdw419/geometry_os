; DESCRIPTION: Composite: Places a green dot at position (25, 245) then Creates a orange rectangular region at (437, 86) spanning 29 by 109 pixels.
; PLAN: r0=25(x), r1=245(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=86(y), r7=29(width), r8=109(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 245
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 437
LDI r6, 86
LDI r7, 29
LDI r8, 109
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
