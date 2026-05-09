; DESCRIPTION: Composite: Places a magenta dot at position (425, 38) then Creates a yellow rectangular region at (343, 65) spanning 16 by 73 pixels.
; PLAN: r0=425(x), r1=38(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=65(y), r7=16(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 38
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 343
LDI r6, 65
LDI r7, 16
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
