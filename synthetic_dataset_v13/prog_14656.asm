; DESCRIPTION: Composite: Places a red dot at position (414, 88) then Creates a red rectangular region at (380, 40) spanning 80 by 37 pixels.
; PLAN: r0=414(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=40(y), r7=80(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 380
LDI r6, 40
LDI r7, 80
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
