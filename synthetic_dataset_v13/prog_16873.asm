; DESCRIPTION: Composite: Creates a magenta rectangular region at (191, 36) spanning 16 by 67 pixels then Sets a single black pixel at (281, 111).
; PLAN: r0=191(x), r1=36(y), r2=16(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=111(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 36
LDI r2, 16
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 111
LDI r7, 0x000000
PSET r5, r6, r7
HALT
