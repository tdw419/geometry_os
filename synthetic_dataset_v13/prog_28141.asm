; DESCRIPTION: Composite: Places a blue dot at position (253, 2) then Creates a orange rectangular region at (353, 61) spanning 73 by 116 pixels.
; PLAN: r0=253(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=61(y), r7=73(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 61
LDI r7, 73
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
