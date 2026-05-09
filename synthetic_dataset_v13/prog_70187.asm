; DESCRIPTION: Composite: Creates a magenta rectangular region at (281, 166) spanning 39 by 47 pixels then Sets a single purple pixel at (215, 123).
; PLAN: r0=281(x), r1=166(y), r2=39(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=123(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 166
LDI r2, 39
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 123
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
