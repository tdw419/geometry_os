; DESCRIPTION: Composite: Creates a red rectangular region at (299, 12) spanning 39 by 72 pixels then Places a blue dot at position (136, 83).
; PLAN: r0=299(x), r1=12(y), r2=39(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=83(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 12
LDI r2, 39
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 83
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
