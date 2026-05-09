; DESCRIPTION: Composite: Sets a single yellow pixel at (257, 10) then Creates a magenta rectangular region at (100, 108) spanning 97 by 34 pixels.
; PLAN: r0=257(x), r1=10(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=100(x), r6=108(y), r7=97(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 10
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 100
LDI r6, 108
LDI r7, 97
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
