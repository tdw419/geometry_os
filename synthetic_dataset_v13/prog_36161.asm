; DESCRIPTION: Composite: Places a orange dot at position (281, 7) then Creates a green rectangular region at (3, 109) spanning 91 by 72 pixels.
; PLAN: r0=281(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=109(y), r7=91(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 3
LDI r6, 109
LDI r7, 91
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
