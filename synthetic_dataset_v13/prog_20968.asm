; DESCRIPTION: Composite: Places a yellow dot at position (174, 246) then Creates a orange rectangular region at (137, 141) spanning 89 by 11 pixels.
; PLAN: r0=174(x), r1=246(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=141(y), r7=89(width), r8=11(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 246
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 141
LDI r7, 89
LDI r8, 11
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
