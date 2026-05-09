; DESCRIPTION: Draws a black rectangle at (294, 182) with width 57 and height 19.
; PLAN: r0=294(x), r1=182(y), r2=57(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 182
LDI r2, 57
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
