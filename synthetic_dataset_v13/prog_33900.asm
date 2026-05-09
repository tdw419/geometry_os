; DESCRIPTION: Composite: Creates a black rectangular region at (368, 199) spanning 82 by 16 pixels then Creates a magenta circular shape at (356, 164) with radius 72.
; PLAN: r0=368(x), r1=199(y), r2=82(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=164(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 199
LDI r2, 82
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 164
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
