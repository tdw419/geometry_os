; DESCRIPTION: Composite: Creates a blue rectangular region at (144, 173) spanning 39 by 65 pixels then Places a white dot at position (160, 102).
; PLAN: r0=144(x), r1=173(y), r2=39(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=102(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 173
LDI r2, 39
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 102
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
