; DESCRIPTION: Composite: Creates a white rectangular region at (96, 160) spanning 36 by 18 pixels then Places a white dot at position (59, 144).
; PLAN: r0=96(x), r1=160(y), r2=36(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=144(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 160
LDI r2, 36
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 144
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
