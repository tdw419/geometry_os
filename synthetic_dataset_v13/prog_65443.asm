; DESCRIPTION: Composite: Places a red dot at position (202, 63) then Creates a yellow rectangular region at (266, 110) spanning 100 by 96 pixels.
; PLAN: r0=202(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=110(y), r7=100(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 266
LDI r6, 110
LDI r7, 100
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
