; DESCRIPTION: Composite: Creates a blue rectangular region at (240, 148) spanning 86 by 74 pixels then Places a magenta dot at position (281, 217).
; PLAN: r0=240(x), r1=148(y), r2=86(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=281(x), r6=217(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 240
LDI r1, 148
LDI r2, 86
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 217
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
