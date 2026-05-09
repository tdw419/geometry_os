; DESCRIPTION: Composite: Renders a orange box of size 67x61 starting at (384, 166) then Places a cyan dot at position (478, 248).
; PLAN: r0=384(x), r1=166(y), r2=67(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=248(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 166
LDI r2, 67
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 248
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
