; DESCRIPTION: Composite: Creates a red rectangular region at (45, 109) spanning 69 by 27 pixels then Places a green circle of radius 31 at center (356, 134).
; PLAN: r0=45(x), r1=109(y), r2=69(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=134(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 109
LDI r2, 69
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 134
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
