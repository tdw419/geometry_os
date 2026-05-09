; DESCRIPTION: Composite: Renders a blue box of size 67x46 starting at (183, 39) then Sets a single purple pixel at (57, 13).
; PLAN: r0=183(x), r1=39(y), r2=67(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=13(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 39
LDI r2, 67
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 13
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
