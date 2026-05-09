; DESCRIPTION: Composite: Sets a single yellow pixel at (313, 163) then Creates a magenta rectangular region at (183, 166) spanning 86 by 47 pixels.
; PLAN: r0=313(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=166(y), r7=86(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 183
LDI r6, 166
LDI r7, 86
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
