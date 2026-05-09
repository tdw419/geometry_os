; DESCRIPTION: Composite: Renders a orange box of size 34x67 starting at (319, 183) then Sets a single purple pixel at (159, 174).
; PLAN: r0=319(x), r1=183(y), r2=34(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=174(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 183
LDI r2, 34
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 174
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
