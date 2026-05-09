; DESCRIPTION: Composite: Sets a single magenta pixel at (279, 245) then Creates a black rectangular region at (312, 92) spanning 24 by 68 pixels.
; PLAN: r0=279(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=92(y), r7=24(width), r8=68(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 92
LDI r7, 24
LDI r8, 68
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
