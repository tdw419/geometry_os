; DESCRIPTION: Composite: Places a red dot at position (499, 187) then Creates a magenta rectangular region at (2, 101) spanning 80 by 83 pixels.
; PLAN: r0=499(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=101(y), r7=80(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 499
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 2
LDI r6, 101
LDI r7, 80
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
