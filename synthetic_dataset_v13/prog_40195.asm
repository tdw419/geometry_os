; DESCRIPTION: Composite: Places a magenta dot at position (379, 232) then Creates a yellow rectangular region at (299, 39) spanning 74 by 55 pixels.
; PLAN: r0=379(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=39(y), r7=74(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 232
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 39
LDI r7, 74
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
